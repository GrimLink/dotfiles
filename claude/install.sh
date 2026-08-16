#!/bin/bash

brew install --cask claude-code

# settings.json has no mcpServers key, so MCP servers must be registered here.
# Full tool set, not --slim: some skills need the tools it drops.
# add is not an upsert, so remove first or a changed command is ignored.
claude mcp remove chrome-devtools --scope user >/dev/null 2>&1
claude mcp add chrome-devtools --scope user -- npx -y chrome-devtools-mcp@latest
