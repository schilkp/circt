#!/usr/bin/env python3
"""Flatten a CIRCT/MLIR-generated Graphviz netlist .dot file.

Given a .dot file with the typical CIRCT graph-printer shape (a module ->
sub-module -> block chain of nested `subgraph cluster_N { ... }` wrappers,
each carrying an invisible `shape = plain` placeholder node for its label),
this produces a flat `digraph` with:

  - all subgraph/cluster nesting removed (including the placeholder nodes)
  - all `hw.constant` nodes removed
  - the `hw.output` terminator node removed
  - block-argument nodes (labels starting with "%...") pinned to the top
    rank (these are the module's inputs)
  - `hw.tfoutput` nodes pinned to the bottom rank (these are the module's
    outputs)
  - every remaining node recolored into one of three categories:
    input / op / output
  - related input/output pairs grouped into vertical columns:
      * register ports:  "%NAME" (input)  <->  hw.tfoutput "NAME_next" (output)
      * memory ports:    "%mem_..._r_N_data" (input),
                         hw.tfoutput "mem_..._r_N_addr" / "..._w_N_{addr,en,data}"
                         (outputs) that share the same "mem_..._[rw]_N" prefix
    Each such group is tied together with invisible edges and a shared
    `group` attribute, so dot keeps the group's nodes in one vertical line
    while remaining free to choose the left-to-right order of the groups
    themselves. (The invisible edges are ordinary rank-constrained edges;
    since their direction already agrees with the input->output flow and
    the endpoints' ranks are separately pinned via rank=min/max, they only
    ever pull nodes into alignment and never fight the existing ranking.)

Usage:
    flatten_dot-_tf.py <in.dot> <out.dot> [--no-group]
"""
import argparse
import re

NODE_RE = re.compile(r'^\s*(v\d+)\s*\[(.*)\]\s*;\s*$')
EDGE_RE = re.compile(r'^\s*(v\d+)\s*->\s*(v\d+)\s*\[(.*)\]\s*;\s*$')
LABEL_RE = re.compile(r'label\s*=\s*"((?:[^"\\]|\\.)*)"')
INPUT_NAME_RE = re.compile(r'^%([^\s:]+)\s*:')
OUTPUT_NAME_RE = re.compile(r'name:\s*\\"([^\\]+)\\"')
MEM_PORT_RE = re.compile(r'^(mem_.+_[rw]_\d+)_(addr|en|data|mask\d*)$')

# HSV colors, in the "H S V" string format graphviz expects.
COLOR_INPUT = "0.350000 0.4 0.95"   # green
COLOR_OP = "0.580000 0.2 0.97"      # blue-grey
COLOR_OUTPUT = "0.050000 0.4 0.95"  # orange


def classify(label: str) -> str:
    """Classify a node by its (still-escaped) label text."""
    if label.strip() == "":
        return "placeholder"
    if label.startswith("hw.constant"):
        return "constant"
    if label.startswith("hw.tfoutput"):
        return "output"
    if label.startswith("hw.output"):
        return "terminator"
    if label.startswith("%"):
        return "input"
    return "op"


def port_name(label: str, kind: str):
    """Extract the logical signal name used for grouping, or None."""
    if kind == "input":
        m = INPUT_NAME_RE.match(label)
        return m.group(1) if m else None
    if kind == "output":
        m = OUTPUT_NAME_RE.search(label)
        return m.group(1) if m else None
    return None


def group_key(name: str) -> str:
    m = MEM_PORT_RE.match(name)
    if m:
        return "mem:" + m.group(1)
    if name.endswith("_next"):
        return "reg:" + name[: -len("_next")]
    return "reg:" + name


def node_num(node_id: str) -> int:
    return int(node_id[1:])


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("infile")
    ap.add_argument("outfile")
    ap.add_argument("--no-group", action="store_true", help="skip vertical grouping of matched input/output pairs")
    args = ap.parse_args()

    with open(args.infile) as f:
        lines = f.readlines()

    nodes = {}   # id -> raw (still-escaped) label text
    edges = []   # (src, dst, attrs)

    for line in lines:
        m = EDGE_RE.match(line)
        if m:
            edges.append((m.group(1), m.group(2), m.group(3)))
            continue
        m = NODE_RE.match(line)
        if m:
            node_id, attrs = m.group(1), m.group(2)
            lm = LABEL_RE.search(attrs)
            nodes[node_id] = lm.group(1) if lm else ""
            continue
        # Anything else - subgraph/cluster headers, cluster `label = "...";`
        # lines, `compound = true;`, stray braces, the outer `digraph G {` -
        # is nesting scaffolding and is simply dropped; we emit our own flat
        # `digraph G { ... }` wrapper below.

    kinds = {nid: classify(label) for nid, label in nodes.items()}

    drop = {"constant", "terminator", "placeholder"}
    keep = {nid for nid, k in kinds.items() if k not in drop}

    color_by_kind = {"input": COLOR_INPUT, "op": COLOR_OP, "output": COLOR_OUTPUT}

    inputs = sorted((n for n in keep if kinds[n] == "input"), key=node_num)
    outputs = sorted((n for n in keep if kinds[n] == "output"), key=node_num)
    ordered = sorted(keep, key=node_num)

    # --- group matched input/output pairs (reg X / X_next, memory ports) ---
    node_group = {}      # nid -> group label, only for nodes worth grouping
    group_edges = []     # (src, dst) invisible connector edges
    if not args.no_group:
        families = {}  # key -> list of nid
        for nid in inputs + outputs:
            name = port_name(nodes[nid], kinds[nid])
            if name is None:
                continue
            families.setdefault(group_key(name), []).append(nid)

        kind_rank = {"input": 0, "output": 1}
        gi = 0
        for members in families.values():
            if len(members) < 2:
                continue
            members.sort(key=lambda n: (kind_rank[kinds[n]], node_num(n)))
            label = f"g{gi}"
            gi += 1
            for nid in members:
                node_group[nid] = label
            for a, b in zip(members, members[1:]):
                group_edges.append((a, b))

    out = ["digraph G {\n"]

    if inputs:
        out.append("  { rank = min; " + " ".join(inputs) + "; }\n")
    if outputs:
        out.append("  { rank = max; " + " ".join(outputs) + "; }\n")

    for nid in ordered:
        color = color_by_kind[kinds[nid]]
        group_attr = f', group = "{node_group[nid]}"' if nid in node_group else ""
        out.append(
            f'  {nid} [fillcolor = "{color}", label = "{nodes[nid]}", '
            f'shape = oval, style = filled{group_attr}];\n'
        )

    for src, dst, attrs in edges:
        if src in keep and dst in keep:
            out.append(f"  {src} -> {dst}[{attrs}];\n")

    for a, b in group_edges:
        out.append(f"  {a} -> {b}[style = invis, weight = 100];\n")

    out.append("}\n")

    with open(args.outfile, "w") as f:
        f.writelines(out)


if __name__ == "__main__":
    main()
