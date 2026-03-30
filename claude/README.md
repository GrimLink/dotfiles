---
Site: https://claude.ai/claude-code
Updated: 2026-03-29
---

# Claude

This contains all my personal Claude Code settings.

## Install

Installs Claude Code and configures the Chrome DevTools MCP with `--slim` for a smaller token footprint, with tools loaded on demand instead of all at once.

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
