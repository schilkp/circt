import base64
import json
import zlib
import marimo as mo
import pandas as pd


def heatmap(
    df: pd.DataFrame, height: str = "92vh", cell_name: str = "heatmap_cell"
) -> mo.Html:
    """Renders a Morpheus Heatmap from a pandas DataFrame within a Marimo notebook.

    Args:
        df: The pandas DataFrame to visualize. Its index and columns will be
          used as row and column labels.
        height: The height of the heatmap iframe.
        cell_name: The name of the marimo cell displaying the heatmap (used for
          CSS overrides).
    """
    df_filled = df.fillna(0)

    rows = int(df_filled.shape[0])
    cols = int(df_filled.shape[1])
    mat = df_filled.values.tolist()
    row_names = list(df_filled.index.astype(str))
    col_names = list(df_filled.columns.astype(str))
    max_path = float(df_filled.max().max())

    # Format JSON structure specifically for Morpheus Dataset
    morpheus_json = {
        "rows": rows,
        "columns": cols,
        "seriesArrays": [mat],
        "seriesDataTypes": ["Float32"],
        "seriesNames": ["Path Length"],
        "rowMetadataModel": {"vectors": [{"name": "id", "array": row_names}]},
        "columnMetadataModel": {"vectors": [{"name": "id", "array": col_names}]},
    }

    # Compress matrix payload to fit easily in Marimo's communication channel
    json_bytes = json.dumps(morpheus_json).encode("utf-8")
    compressed_bytes = zlib.compress(json_bytes)
    compressed_b64 = base64.b64encode(compressed_bytes).decode("utf-8")

    html_template = """<!DOCTYPE html>
    <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
      <title>Morpheus Heatmap</title>
      <link rel="stylesheet" href="https://software.broadinstitute.org/morpheus/css/morpheus-latest.min.css">
      <style>
    body {
      margin: 0;
      padding: 0;
      background-color: white;
      font-family: sans-serif;
    }
      </style>
    </head>
    <body>
      <div id="vis" style="width: 100%; height: 100%; border: none; background: white;"></div>

      <script type="text/javascript" src="https://software.broadinstitute.org/morpheus/js/morpheus-external-latest.min.js"></script>
      <script src="https://software.broadinstitute.org/morpheus/js/morpheus-latest.min.js"></script>

      <script>
    (async () => {
        const compressedB64 = "__COMPRESSED_DATA__";
        const max_val = __MAX_PATH__;

        // Decode base64 to Uint8Array
        const binaryString = atob(compressedB64);
        const len = binaryString.length;
        const bytes = new Uint8Array(len);
        for (let i = 0; i < len; i++) {
            bytes[i] = binaryString.charCodeAt(i);
        }

        // Native decompression
        const blob = new Blob([bytes]);
        const decompressionStream = blob.stream().pipeThrough(new DecompressionStream('deflate'));
        const response = new Response(decompressionStream);
        const jsonText = await response.text();
        const dataset_json = JSON.parse(jsonText);

        // Initialize Morpheus HeatMap
        new morpheus.HeatMap({
            el: $('#vis'),
            dataset: morpheus.Dataset.fromJSON(dataset_json),
            colorScheme: {
                type: 'fixed',
                map: [
                    { value: 0, color: '#ffffff' },
                    { value: 1, color: '#0d0887' },
                    { value: max_val * 0.25, color: '#7003a4' },
                    { value: max_val * 0.5, color: '#b82e8f' },
                    { value: max_val * 0.75, color: '#e67055' },
                    { value: max_val, color: '#f0f921' }
                ]
            }
        });
    })();
      </script>
    </body>
    </html>
    """

    # Render with exact replacements
    rendered_html = html_template.replace(
        "__COMPRESSED_DATA__", compressed_b64
    ).replace("__MAX_PATH__", str(max_path))

    # Initialize the heatmap widget using Marimo's official sandbox iframe
    heatmap_widget = mo.iframe(rendered_html, height=height)

    style_override = mo.Html(
        f"""
    <style>
        [data-cell-name="{cell_name}"] iframe,
        [data-cell-name="{cell_name}"] .output-area,
        [data-cell-name="{cell_name}"] .output,
        [data-cell-name="{cell_name}"] .output-block,
        [data-cell-name="{cell_name}"] .marimo-output {{
            height: {height} !important;
            max-height: none !important;
        }}
    </style>
    """
    )

    return mo.vstack([style_override, heatmap_widget])
