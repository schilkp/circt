import marimo

__generated_with = "0.23.13"
app = marimo.App(width="full")


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    # Netlist Structure Explorer
    """)
    return


@app.cell
def _():
    import os

    import marimo as mo
    import matplotlib.pyplot as plt
    import numpy as np
    import pandas as pd
    import seaborn as sns

    from rtl_netlist_stats.mo_morpheus import heatmap
    from rtl_netlist_stats.parse_dot import parse_dot_file
    from rtl_netlist_stats.tf import dot_to_tf

    return dot_to_tf, heatmap, mo, np, os, parse_dot_file, pd, plt, sns


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Data Input
    """)
    return


@app.cell
def _(mo, os):
    # Input dot directory path:
    notebook_dir = (
        os.path.dirname(__file__) if "__file__" in globals() else "."
    )
    out_dir = os.path.normpath(os.path.join(notebook_dir, "..", "..", "out"))

    dot_files = []
    if os.path.exists(out_dir):
        dot_files = sorted(
            [f for f in os.listdir(out_dir) if f.endswith(".dot")]
        )

    options = {f: os.path.join(out_dir, f) for f in dot_files}
    dot_select = mo.ui.dropdown(
        options=options,
        value=None,
        label="Select DOT File",
    )
    dot_select
    return (dot_select,)


@app.cell
def _(dot_select, dot_to_tf, mo, parse_dot_file):
    # Read dot file + convert to tf:
    mo.stop(not dot_select.value, "Please select a valid DOT file.")
    graph = parse_dot_file(dot_select.value)
    tf = dot_to_tf(graph)
    return (tf,)


@app.cell
def _(np, pd, tf):
    # Calculate in-out path lengths:
    distances = tf.calc_inp_outp_max_distance()

    out_nodes = tf.output_nodes
    in_nodes = tf.input_nodes

    matrix_data = []
    for inp in in_nodes:
        row = {}
        for out in out_nodes:
            val = distances[inp].get(out, -float("inf"))
            row[out] = val if val != -float("inf") else np.nan
        matrix_data.append(row)

    df_matrix = pd.DataFrame(
        matrix_data, index=[tf.g.nodes[i]["label"] for i in in_nodes])
    df_matrix.columns = [tf.g.nodes[o]["label"] for o in out_nodes]

    non_pure_in = [
        tf.g.nodes[n]["label"]
        for n in tf.input_nodes
        if tf.g.nodes[n].get("kind") in ["in_reg", "in_mem"]
    ]
    non_pure_out = [
        tf.g.nodes[n]["label"]
        for n in tf.output_nodes
        if tf.g.nodes[n].get("kind") in ["out_reg", "out_mem"]
    ]
    valid_cols = [c for c in non_pure_out if c in df_matrix.columns]
    valid_rows = [r for r in non_pure_in if r in df_matrix.index]
    df_matrix_state = df_matrix.loc[valid_rows, valid_cols]
    return (df_matrix_state,)


@app.cell
def _(df_matrix_state, pd, tf, np):
    # Stats for each input, output, path:
    # Filter out all rows that are all NA
    non_na_rows = df_matrix_state.dropna(how="all", axis=0)
    non_na_cols = df_matrix_state.dropna(how="all", axis=1)

    # Map node label -> bitwidth (parsed from node "type")
    def _bw(t):
        return int(t.strip('i'))

    label_bw = {
        data["label"]: _bw(data["type"])
        for _, data in tf.g.nodes(data=True)
        if "type" in data and "label" in data
    }

    # 1. All inputs and max path length to non-pure outputs
    df_in_summary = pd.DataFrame({
        "max_path_length": non_na_rows.max(axis=1),
        "num_outputs_fed": non_na_rows.notna().sum(axis=1),
        "furthest_output": non_na_rows.idxmax(axis=1)
    }).sort_values("max_path_length", ascending=False)
    df_in_summary.insert(0, "bitwidth", [label_bw.get(
        lbl, np.nan) for lbl in df_in_summary.index])

    # 2. All outputs and max path length to non-pure inputs
    df_out_summary = pd.DataFrame({
        "max_path_length": non_na_cols.max(axis=0),
        "num_inputs_fed_from": non_na_cols.notna().sum(axis=0),
        "furthest_input": non_na_cols.idxmax(axis=0)
    }).sort_values("max_path_length", ascending=False)
    df_out_summary.insert(0, "bitwidth", [label_bw.get(
        lbl, np.nan) for lbl in df_out_summary.index])

    df_in_to_out = df_matrix_state.stack().reset_index()
    df_in_to_out.columns = ["state_input", "state_output", "path_length"]
    df_in_to_out = df_in_to_out.sort_values("path_length", ascending=False)
    return df_in_summary, df_in_to_out, df_out_summary


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Overview Tables
    """)
    return


@app.cell
def _(mo, pd, tf):
    # I/O Overview table
    def bw(i: str):
        return int(i.strip('i'))

    records = []
    for id in tf.input_nodes:
        n = tf.g.nodes[id]
        if n["kind"] == "in":
            records.append(
                {"name": n["label"], "category": n["kind"], "bitwidth": bw(n["type"])})

    for id in tf.output_nodes:
        n = tf.g.nodes[id]
        if n["kind"] == "out":
            records.append(
                {"name": n["label"], "category": n["kind"], "bitwidth": bw(n["type"])})

    df_io = pd.DataFrame(records)
    ui_io = mo.ui.table(df_io, selection=None)
    ui_io
    return


@app.cell
def _(df_in_summary, mo):
    ui1 = mo.vstack([
        mo.md("### State Inputs"),
        mo.ui.table(df_in_summary, selection=None)
    ])
    ui1
    return


@app.cell
def _(mo, df_out_summary):
    ui2 = mo.vstack([
        mo.md("### State Outputs"),
        mo.ui.table(df_out_summary, selection=None)
    ])
    ui2
    return


@app.cell
def _(df_in_to_out, mo):
    ui3 = mo.vstack([
        mo.md("### State I/O Paths"),
        mo.ui.table(df_in_to_out, selection=None)
    ])
    ui3
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Stats/Plots
    """)
    return


@app.cell
def _(df_matrix_state, mo, plt, sns):
    # Input/output histograms
    # Max path length from each input
    max_len_inputs = df_matrix_state.max(axis=1).reset_index()
    max_len_inputs.columns = ["input", "max_path_length"]

    fig_in, ax_in = plt.subplots(figsize=(5, 4))
    sns.histplot(data=max_len_inputs.dropna(), x="max_path_length", ax=ax_in)
    ax_in.set_title("Max Path Length from Each State Input to State Output")

    # Max path length to each output
    max_len_outputs = df_matrix_state.max(axis=0).reset_index()
    max_len_outputs.columns = ["output", "max_path_length"]

    fig_out, ax_out = plt.subplots(figsize=(5, 4))
    sns.histplot(data=max_len_outputs.dropna(), x="max_path_length", ax=ax_out)
    ax_out.set_title("Max Path Length to Each State Output from State Input")
    mo.hstack([fig_in, fig_out], justify="start")
    return


@app.cell
def _(df_matrix_state, pd, plt, sns):
    max_path_lens = df_matrix_state.max(axis=0)
    num_feeding_inputs = df_matrix_state.notna().sum(axis=0)
    plot_df = pd.DataFrame(
        {"max_path_length": max_path_lens, "num_inputs": num_feeding_inputs}
    ).dropna()
    fig_scatter, ax_scatter = plt.subplots(figsize=(8, 6))
    sns.scatterplot(
        data=plot_df, x="max_path_length", y="num_inputs", ax=ax_scatter
    )
    ax_scatter.set_title(
        "State Outputs: Max Path Length vs Feeding State Inputs"
    )
    fig_scatter
    return (plot_df,)


@app.cell
def _(df_out_summary, plt, sns):
    # Histogram of fan-in of non-pure (state: FF or Memory) outputs.
    # Fan-in = number of non-pure (state) inputs required to compute the output.
    fanin = df_out_summary["num_inputs_fed_from"]
    fig_fanin, ax_fanin = plt.subplots(figsize=(8, 4))
    sns.histplot(data=fanin, ax=ax_fanin, discrete=True)
    ax_fanin.set_title(
        "Fan-in Histogram of Non-Pure (State) Outputs"
    )
    ax_fanin.set_xlabel("Number of Non-Pure (State) Inputs")
    ax_fanin.set_ylabel("Number of Non-Pure (State) Outputs")
    fig_fanin
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## State Output: Input Cone Viz
    """)
    return


@app.cell
def _(mo):
    fanin_output_text = mo.ui.text(
        value="",
        placeholder="Paste a state output name (e.g. from the State Outputs table)",
        label="State Output Name",
    )
    fanin_output_text
    return (fanin_output_text,)


@app.cell
def _(fanin_output_text, mo, tf):
    import networkx as nx_fanin

    target_label = fanin_output_text.value.strip()
    mo.stop(
        not target_label,
        "Please enter a valid state output name (copy one from the State Outputs table).",
    )

    # Map the pasted label to a node id, restricted to non-pure (state) outputs
    target_id = None
    for nid, ndata in tf.g.nodes.items():
        if ndata.get("kind") in ["out_reg", "out_mem"] and ndata.get("label") == target_label:
            target_id = nid
            break

    mo.stop(
        not target_id,
        f"No state output named '{target_label}' found.",
    )

    # Build the fan-in cone: the selected output plus all of its ancestors
    nodes_in_cone = {target_id}
    nodes_in_cone.update(nx_fanin.ancestors(tf.g, target_id))
    sub_g_fanin = tf.g.subgraph(nodes_in_cone).copy()

    # Remove constants from the cone
    const_nodes = [
        n for n, d in sub_g_fanin.nodes(data=True)
        if d.get("kind") == "op" and "hw.constant" in d.get("label", "")
    ]
    sub_g_fanin.remove_nodes_from(const_nodes)

    # Style nodes: inputs (state) vs muxes vs the selected output vs other ops
    for fid, fattrs in sub_g_fanin.nodes(data=True):
        fkind = fattrs.get("kind", "op")
        forig_label = fattrs.get("label", fid)
        flabel = forig_label.replace('\\"', '').replace(
            '"', '').replace('\\', '')
        fnode_type = fattrs.get("type", "")
        if fnode_type:
            flabel = f"{flabel}\n({fnode_type})"
        fattrs["label"] = flabel
        fattrs["style"] = "filled"

        if fkind in ("in_reg", "in_mem"):
            fattrs["fillcolor"] = "#c7e9b4"  # green: state inputs
            fattrs["shape"] = "box"
        elif fkind == "in":
            fattrs["fillcolor"] = "#cfe2f3"  # light blue: pure inputs
            fattrs["shape"] = "box"
        elif fkind in ("out_reg", "out_mem"):
            fattrs["fillcolor"] = "#ffcccb"  # red: selected state output
            fattrs["shape"] = "box"
        elif fkind == "op" and "comb.mux" in forig_label:
            fattrs["fillcolor"] = "#ffd966"  # orange: muxes
            fattrs["shape"] = "ellipse"
        else:
            fattrs["fillcolor"] = "#eeeeee"  # neutral: other ops
            fattrs["shape"] = "ellipse"

    pydot_g_fanin = nx_fanin.drawing.nx_pydot.to_pydot(sub_g_fanin)
    pydot_g_fanin.set_rankdir("LR")
    png_bytes_fanin = pydot_g_fanin.create_png()
    dot_string_fanin = pydot_g_fanin.to_string()

    fanin_ui = mo.vstack([
        mo.md(f"### Fan-in Cone for `{target_label}`"),
        mo.image(src=png_bytes_fanin),
        mo.md("#### Raw DOT Code"),
        mo.ui.text_area(
            value=dot_string_fanin,
            label="DOT Code (click inside and press Ctrl+A, Ctrl+C to copy)",
            rows=15,
        ),
    ])
    fanin_ui
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Heatmaps
    """)
    return


@app.cell
def heatmap_cell(df_matrix_state, heatmap):
    heatmap(df_matrix_state, cell_name="heatmap_cell")
    return


@app.cell
def _(df_matrix_state, mo, np, plt):
    import io

    import matplotlib.cm as cm
    import matplotlib.colors as mcolors
    from PIL import Image

    # Render non-pure to non-pure full heatmap as an image
    data = df_matrix_state.values
    data_nan = np.isnan(data)

    valid_data = data[~data_nan]
    if len(valid_data) > 0:
        vmax = float(valid_data.max())
        if vmax > 0:
            norm_data = data / vmax
            norm_data = np.clip(norm_data, 0, 1)
        else:
            norm_data = np.zeros_like(data)
    else:
        norm_data = np.zeros_like(data)
        vmax = 1

    colormap = cm.plasma
    colored_data = colormap(norm_data)

    # Set NaNs to white
    colored_data[data_nan] = [1, 1, 1, 1]

    img_data = (colored_data * 255).astype(np.uint8)
    img = Image.fromarray(img_data, mode='RGBA')

    buf = io.BytesIO()
    img.save(buf, format='PNG')
    img_element = mo.image(src=buf.getvalue())

    fig, ax = plt.subplots(figsize=(6, 0.5))
    fig.subplots_adjust(bottom=0.5)
    cb = plt.colorbar(cm.ScalarMappable(norm=mcolors.Normalize(
        vmin=0, vmax=vmax), cmap=colormap), cax=ax, orientation='horizontal')
    cb.set_label('Path Length')
    buf_cb = io.BytesIO()
    fig.savefig(buf_cb, format='PNG', bbox_inches='tight')
    plt.close(fig)
    cb_element = mo.image(src=buf_cb.getvalue(), width="25%")

    ui_element = mo.vstack([img_element, mo.Html(
        "<div style='height: 20px;'></div>"), cb_element])
    ui_element
    return


if __name__ == "__main__":
    app.run()
