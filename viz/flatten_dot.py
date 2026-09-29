#!/usr/bin/env python3
"""Flatten a CIRCT/MLIR-generated Graphviz netlist .dot file.

Given a .dot file with the typical CIRCT graph-printer shape (a module ->
sub-module -> block chain of nested `subgraph cluster_N { ... }` wrappers,
each carrying an invisible `shape = plain` placeholder node for its label),
this produces a flat `digraph` with:

  - all subgraph/cluster nesting removed (including the placeholder nodes)
  - all `hw.constant` nodes removed
  - the `%io_clock` and `%io_reset` block-argument nodes removed
  - the `%basepath` block argument and `om.class.fields` nodes removed
  - a `kind` attribute added to every remaining node: the op's dialect
    prefix (e.g. "hw", "comb", "seq") for ops, or "input" for the
    remaining `%`-prefixed block arguments
  - the `hw.output` terminator removed; each edge that used to enter it
    instead terminates on its own new node, labeled "from '<source label>'",
    with `kind = "output"`
  - each `seq.firmem` fused with its `seq.firmem.*_port` ops into a single
    node: every port's external inputs become inputs of the fused node,
    and every port's external outputs become outputs of the fused node

Usage:
    flatten_dot.py <in.dot> <out.dot>
"""
import argparse
import re

NODE_RE = re.compile(r'^\s*(v\d+)\s*\[(.*)\]\s*;\s*$')
EDGE_RE = re.compile(r'^\s*(v\d+)\s*->\s*(v\d+)\s*\[(.*)\]\s*;\s*$')
LABEL_RE = re.compile(r'label\s*=\s*"((?:[^"\\]|\\.)*)"')
OP_KIND_RE = re.compile(r'^([A-Za-z_]\w*)\.')


def label_of(attrs: str) -> str:
    lm = LABEL_RE.search(attrs)
    return lm.group(1) if lm else ""


def kind_of(label: str) -> str:
    """Classify a node: "input" for block arguments, otherwise the op's
    dialect prefix (e.g. "hw", "comb", "seq"), or "" if none is found."""
    if label.startswith("%"):
        return "input"
    m = OP_KIND_RE.match(label)
    return m.group(1) if m else ""


def is_dropped(label: str) -> bool:
    """Placeholder cluster-label nodes, hw.constant ops, the clock/reset
    block arguments, and the om basepath/class-fields nodes are dropped
    outright. `hw.output` is handled separately, since it is replaced
    rather than simply dropped."""
    return (
        label.strip() == ""
        or label.startswith("hw.constant")
        or label.startswith("%io_clock")
        or label.startswith("%io_reset")
        or label.startswith("%basepath")
        or label.startswith("om.class.fields")
    )


def node_num(node_id: str) -> int:
    return int(node_id[1:])


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("infile")
    ap.add_argument("outfile")
    args = ap.parse_args()

    with open(args.infile) as f:
        lines = f.readlines()

    nodes = {}   # id -> raw attrs text
    edges = []   # (src, dst, attrs)

    for line in lines:
        m = EDGE_RE.match(line)
        if m:
            edges.append((m.group(1), m.group(2), m.group(3)))
            continue
        m = NODE_RE.match(line)
        if m:
            nodes[m.group(1)] = m.group(2)
            continue
        # Anything else - subgraph/cluster headers, cluster `label = "...";`
        # lines, `compound = true;`, stray braces, the outer `digraph G {` -
        # is nesting scaffolding and is simply dropped; we emit our own flat
        # `digraph G { ... }` wrapper below.

    terminators = {nid for nid, attrs in nodes.items() if label_of(attrs) == "hw.output"}
    keep = {
        nid
        for nid, attrs in nodes.items()
        if nid not in terminators and not is_dropped(label_of(attrs))
    }

    # --- fuse each seq.firmem with its read/write ports into one node ---
    def is_firmem(nid):
        return label_of(nodes[nid]).startswith("seq.firmem ")

    def is_firmem_port(nid):
        return label_of(nodes[nid]).startswith("seq.firmem.")

    redirect = {}  # port node id -> the seq.firmem node id it is fused into
    for nid in keep:
        if not is_firmem(nid):
            continue
        for src, dst, _ in edges:
            if src == nid and dst in keep and is_firmem_port(dst):
                redirect[dst] = nid

    keep -= set(redirect)

    def resolve(nid):
        return redirect.get(nid, nid)

    out = ["digraph G {\n"]
    for nid in sorted(keep, key=node_num):
        kind = kind_of(label_of(nodes[nid]))
        out.append(f'  {nid} [{nodes[nid]}, kind = "{kind}"];\n')

    output_count = 0
    for src, dst, attrs in edges:
        src, dst = resolve(src), resolve(dst)
        if src == dst:
            continue
        if dst in terminators:
            if src not in keep:
                continue
            output_node = f"output{output_count}"
            output_count += 1
            src_label = label_of(nodes[src])
            out.append(
                f'  {output_node} [label = "from \'{src_label}\'", shape = oval, kind = "output"];\n'
            )
            out.append(f"  {src} -> {output_node}[{attrs}];\n")
        elif src in keep and dst in keep:
            out.append(f"  {src} -> {dst}[{attrs}];\n")
    out.append("}\n")

    with open(args.outfile, "w") as f:
        f.writelines(out)


if __name__ == "__main__":
    main()
