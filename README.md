This is an example of an MCP server for data query and analysis applied on a synthetic supermarket database.
Check out https://medium.com/@alieladi/core-components-of-a-data-query-analysis-mcp-server-ec2cd6cde34d for more info!
## Tool summary

| Tool                                   | Purpose                                      |
| -------------------------------------- | -------------------------------------------- |
| `sql_query(sql, params)`               | Execute smart SELECT queries                 |
| `cache_get_rows(cache_key)`            | Page through cached results                  |
| `run_python_on_cache(cache_key, code)` | Run Python code (e.g. Pandas) on cached data |
| `get_schema()`                         | Return schema resource                       |
| `search_products_catalog(query)`       | Semantic + lexical hybrid search             |


## Installation and setup (uv)

The supermarket MCP server lives in `supermarket/mcp_server` and uses uv for dependency management.

Requirements
- uv installed (see https://docs.astral.sh/uv/getting-started/)
- Python 3.13 (uv can install it automatically)

Steps
1) Install uv (if you don't already have it) — see https://docs.astral.sh/uv/getting-started/

2) Optional but recommended: Install dependencies with uv:
     - From the repo root (this folder):
         - Sync the server env without activating a venv:
             - `uv sync --directory supermarket/mcp_server`
         - Or create and activate a venv explicitly:
             - `uv venv --python 3.13`
             - `source .venv/bin/activate`
             - `cd supermarket/mcp_server && uv sync`
Note: Without this step, the first mcp server run may take a few minutes if uv needs to install Python or large dependencies.

3) Get a `VOYAGE_API_KEY` — required for semantic search in `search_products_catalog`- from https://www.voyageai.com/


## Use with Claude Desktop (MCP)

Add this to your Claude Desktop `mcpServers` config. Update the absolute path to match your machine.

```json
{
    "mcpServers": {
        "supermarket": {
            "command": "uv", 
            "args": [
                "--directory",
                "/absolute/path/to/your/checkout/supermarket/mcp_server",
                "run",
                "main.py"
            ],
            "env": {
                "VOYAGE_API_KEY": "YOUR_VOYAGE_API_KEY"
            }
        }
    }
}
```
Notes
- If `uv` isn’t on your PATH, use its full path.
- `VOYAGE_API_KEY` is required for semantic search in `search_products_catalog`.

