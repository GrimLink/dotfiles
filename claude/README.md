---
Site: https://claude.ai/claude-code
Updated: 2026-08-16
---

# Claude

This contains all my personal Claude Code settings.

## Install

Installs Claude Code and registers the Chrome DevTools MCP at user scope.

MCP servers cannot be declared in `settings.json`. It has no `mcpServers` key and ignores one silently. They live in `~/.claude.json` and are registered with `claude mcp add`, which is why this sits in `install.sh` rather than the synced settings.

It is registered with its full tool set, not `--slim`. Tool schemas load on demand either way, so the token saving was smaller than it looked. The skills that need the dropped tools say so themselves.

```sh
./claude/install.sh
```

## Setup

Syncs settings to `~/.claude/`, then links the shared agent config into place.

```sh
./claude/setup.sh
```

Run [agents](../agents/README.md) first, since the links point at `~/.agents/`.

## Settings

Global Claude Code settings synced to `~/.claude/settings.json`.

Contains default permissions and behavior preferences.

## Instructions and skills

Neither lives here. Both are tool agnostic, so they sit in
[agents](../agents/README.md) and are symlinked in:

- `~/.claude/CLAUDE.md` points at `~/.agents/AGENTS.md`
- `~/.claude/skills` points at `~/.agents/skills`

Editing either one through the symlink edits the shared copy, which is the
intent. Run `./agents/setup.sh` to push repo changes out.
