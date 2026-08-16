# Ray Skill: PHP-First Debugging (Curl Edition)

This skill integrates Spatie's Ray with the AI agent using `curl` to interact with the Ray MCP. It prioritizes a fast, tool-independent debugging loop.

## Primary Workflow

### 1. Inject & Prepare
Insert the `ray()` call into the relevant PHP file.
- **Tools**: Use `replace` or `write_file`.
- **Snippet**: `ray($var)->label('Debug Point');` or `ray()->trace();`.
- **Cache Warning**: In environments like Magento, you **MUST** flush relevant caches (e.g., `bin/magento cache:flush layout full_page`) after injection.

### 2. Execute
Trigger the code execution.
- **Web**: Refresh the browser or use `curl -k -I <URL>`.
- **CLI**: Run the relevant command or script.

### 3. Discover (One-time per session)
Find the active Ray window to target the correct project.
```bash
curl -s -X POST http://localhost:2411/mcp \
  -H "Content-Type: application/json" \
  -H "Accept: application/json, text/event-stream" \
  -d '{"jsonrpc": "2.0", "method": "tools/call", "params": {"name": "get_ray_windows", "arguments": {}}, "id": 1}'
```
*Note the `projectName` and `hostname` from the result.*

### 4. Capture Logs
Retrieve the logs using the discovered project name.
```bash
curl -s -X POST http://localhost:2411/mcp \
  -H "Content-Type: application/json" \
  -H "Accept: application/json, text/event-stream" \
  -d '{"jsonrpc": "2.0", "method": "tools/call", "params": {"name": "get_ray_window_logs", "arguments": {"projectName": "default", "limit": 5}}, "id": 1}'
```

### 5. Cleanup
Remove injected `ray()` calls immediately after verification.

## MCP Tool Reference (via Curl)
- `get_ray_windows`: Lists active projects and hostnames.
- `get_ray_window_logs`: Retrieves logs (requires `projectName`).
- `send_ray_clear_all`: Clears the window.
- `send_custom_html_output`: Sends rich HTML to Ray.

## Cache-Heavy Environments (e.g. Magento)
Always assume the template is cached.
1. Inject `ray()`.
2. `bin/magento cache:flush layout full_page`.
3. Trigger page load.
4. Capture logs.
5. Revert changes + `bin/magento cache:flush`.
