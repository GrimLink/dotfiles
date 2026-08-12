#!/bin/bash

brew install --cask claude-code

# settings.json has no mcpServers key, so MCP servers must be registered here.
# Not --slim: that exposes only 3 tools and drops take_snapshot and
# list_console_messages, which the a11y-audit skill depends on.
claude mcp remove chrome-devtools --scope user >/dev/null 2>&1
claude mcp add chrome-devtools --scope user -- npx -y chrome-devtools-mcp@latest
