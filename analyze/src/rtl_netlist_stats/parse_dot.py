import re
from typing import Any, Dict, List, Tuple


class Node:
    def __init__(self, name: str, attrs: Dict[str, str]):
        self.name = name
        self.attrs = attrs

    def get_name(self) -> str:
        return self.name

    def get_label(self) -> str | None:
        return self.attrs.get('label')

    def get_attributes(self) -> Dict[str, str]:
        return self.attrs

    def to_string(self) -> str:
        attr_strs = [f'{k}={v}' for k, v in self.attrs.items()]
        return f"{self.name} [{', '.join(attr_strs)}];"


class Edge:
    def __init__(self, source: str, destination: str, attrs: Dict[str, str]):
        self.source = source
        self.destination = destination
        self.attrs = attrs

    def get_source(self) -> str:
        return self.source

    def get_destination(self) -> str:
        return self.destination

    def get_attributes(self) -> Dict[str, str]:
        return self.attrs


class DotGraph:
    def __init__(self, nodes: List[Node], edges: List[Edge]):
        self.nodes = nodes
        self.edges = edges

    def get_nodes(self) -> List[Node]:
        return self.nodes

    def get_edge_list(self) -> List[Edge]:
        return self.edges


def parse_attributes(attr_str: str) -> Dict[str, str]:
    attrs = {}
    if not attr_str:
        return attrs
    # Match key = value. Value can be a double-quoted string or a bare identifier.
    # Group 1: key, Group 2: quoted value (with quotes), Group 3: bare value
    pattern = r'([a-zA-Z_][a-zA-Z0-9_]*)\s*=\s*(?:("(?:[^"\\]|\\.)*")|([a-zA-Z0-9_.\-]+))'
    for match in re.finditer(pattern, attr_str):
        key = match.group(1)
        val = match.group(2) if match.group(2) is not None else match.group(3)
        attrs[key] = val
    return attrs


def parse_dot_file(filepath: str) -> DotGraph:
    nodes = []
    edges = []

    # Pre-compile regexes for high speed
    attr_re = re.compile(r'\[(.*)\]\s*;?$')
    edge_re = re.compile(r'([a-zA-Z0-9_:]+)\s*->\s*([a-zA-Z0-9_:]+)')
    node_name_re = re.compile(r'^([a-zA-Z0-9_]+)')

    with open(filepath, 'r') as f:
        for line in f:
            line = line.strip()
            if not line.startswith('v'):
                continue

            # Extract attributes if any
            attr_match = attr_re.search(line)
            attr_str = attr_match.group(1) if attr_match else ""
            attrs = parse_attributes(attr_str)

            # Check if edge or node
            if '->' in line:
                match = edge_re.search(line)
                if match:
                    src, dest = match.group(1), match.group(2)
                    edges.append(Edge(src, dest, attrs))
            else:
                name_match = node_name_re.match(line)
                if name_match:
                    name = name_match.group(1)
                    nodes.append(Node(name, attrs))

    return DotGraph(nodes, edges)
