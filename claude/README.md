---
Site: https://claude.ai/claude-code
Updated: 2026-03-29
---

# Claude

This contains all my personal Claude Code settings.

## Install

Installs Claude Code and registers the Chrome DevTools MCP at user scope.

MCP servers cannot be declared in `settings.json`. It has no `mcpServers` key and ignores one silently. They live in `~/.claude.json` and are registered with `claude mcp add`, which is why this sits in `install.sh` rather than the synced settings.

The server runs with its full tool set. `--slim` exposes only three tools and drops `take_snapshot` and `list_console_messages`, which the `a11y-audit` skill depends on. Tool schemas load on demand regardless, so the token saving was smaller than it looked.

```sh
./claude/install.sh
```

## Setup

Syncs settings and `CLAUDE.md` to `~/.claude/`.

```sh
./claude/setup.sh
```

## Settings

Global Claude Code settings synced to `~/.claude/settings.json`.

Contains default permissions and behavior preferences.

## CLAUDE.md

Global instructions for Claude Code, synced to `~/.claude/CLAUDE.md`.

Defines coding standards, preferences, and project-specific guidelines.
