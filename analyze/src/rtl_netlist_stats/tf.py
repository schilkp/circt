import networkx as nx

from rtl_netlist_stats.parse_dot import DotGraph, Edge, Node


class TransferFunction:
    def __init__(self, g,
                 input_nodes: list[str],
                 output_nodes: list[str]):
        self.g = g
        self.input_nodes = input_nodes
        self.output_nodes = output_nodes

    def calc_inp_outp_max_distance(self) -> dict[str, dict[str, float]]:
        topo_order = list(nx.topological_sort(self.g))
        distances: dict[str, dict[str, float]] = {}
        output_set = set(self.output_nodes)
        
        for inp in self.input_nodes:
            dist: dict[str, float] = {inp: 0.0}
            for u in topo_order:
                u_dist = dist.get(u)
                if u_dist is not None: # only prop. distances if node is reachable from inp
                    for v in self.g[u]: # for all sucessors
                        v_dist = dist.get(v, -float("inf"))
                        if u_dist + 1 > v_dist:
                            dist[v] = u_dist + 1
            
            # Store only distances for outputs, not intermed. nodes:
            distances[inp] = {out: dist[out] for out in output_set if out in dist}
            
        return distances


def parse_input_label(l: str) -> tuple[str, str, str]:  # (type, name, kind)
    # Sample: '%in_reset : i1'
    assert (l.startswith("\"%"))
    l = l.strip('"').lstrip("%")
    name, type_str = l.split(" : ", maxsplit=1)

    if name.startswith("reg_"):
        kind = "in_reg"
    elif name.startswith("mem_"):
        kind = "in_mem"
    else:
        assert (name.startswith("in_"))
        kind = "in"

    return (type_str, name, kind)


def parse_tfoutput_label(l: str) -> tuple[str, str, str]:  # (type, name, kind)
    # Sample: 'hw.tfoutput : i1 attr={name: \"out_UART0_tx\"}'
    assert ("hw.tfoutput" in l)

    l = l.strip('"').lstrip("hw.tfoutput : ")

    type_str, attr_str = l.split(" ", maxsplit=1)
    assert (attr_str.startswith("attr="))

    _, name = attr_str.split("name: \\\"")
    name = name.split("\\\"")[0]

    if name.startswith("reg_"):
        kind = "out_reg"
    elif name.startswith("mem_"):
        kind = "out_mem"
    else:
        assert (name.startswith("out_"))
        kind = "out"

    return (type_str, name, kind)


def dot_to_tf(graph: DotGraph):

    # Classify nodes:
    input_nodes: list[Node] = []
    op_nodes: list[Node] = []
    tfoutput_nodes: list[Node] = []
    output_node: Node | None = None

    for node in graph.nodes:
        node_label = node.get_label()  # type: ignore
        assert (node_label)
        node_label = node_label.strip()
        if node_label == '" "':
            continue

        if node_label.startswith("\"%in_"):
            input_nodes.append(node)
        elif node_label.startswith("\"%reg_"):
            input_nodes.append(node)
        elif node_label.startswith("\"%mem_"):
            input_nodes.append(node)
        elif "hw.tfoutput" in node_label:
            tfoutput_nodes.append(node)
        elif "hw.output" in node_label:
            assert (not output_node)
            output_node = node
        else:
            op_nodes.append(node)

    assert (output_node)

    # Filter-out edges to hw.output
    # (we only use tfoutput nodeS)
    normal_edges: list[Edge] = []
    for edge in graph.get_edge_list():
        destination = edge.get_destination()
        if destination != output_node.get_name():
            normal_edges.append(edge)

    # Construct networkx graph:
    G = nx.DiGraph()

    for node in input_nodes:
        type_str, name, kind = parse_input_label(node.get_label())
        G.add_node(node.get_name(), kind=kind,
                   label=name, type=type_str)
    for node in op_nodes:
        G.add_node(node.get_name(), kind="op",
                   label=node.get_label().strip('"'))

    for node in tfoutput_nodes:
        type_str, name, kind = parse_tfoutput_label(node.get_label())
        G.add_node(node.get_name(), kind=kind,
                   label=name, type=type_str)

    for edge in normal_edges:
        source = edge.get_source()
        destination = edge.get_destination()
        G.add_edge(source, destination)

    input_node_ids = [node.get_name() for node in input_nodes]
    output_node_ids = [node.get_name() for node in tfoutput_nodes]

    return TransferFunction(G, input_node_ids, output_node_ids)
