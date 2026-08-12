---
Site: https://developers.google.com/gemini-code-assist
Updated: 2026-03-29
---

# Gemini CLI

This contains all my personal Gemini CLI settings.

## Install

Installs Gemini CLI and configures the Chrome DevTools MCP with its full tool set. `--slim` exposes only three tools and drops `take_snapshot` and `list_console_messages`, which the `a11y-audit` skill depends on.

```sh
./gemini/install.sh
```

## Setup

Syncs settings and `GEMINI.md` to `~/.gemini/`.

```sh
./gemini/setup.sh
```

## Settings

Global Gemini CLI settings synced to `~/.gemini/settings.json`.

Contains default permissions and behavior preferences.

## GEMINI.md

Global instructions for Gemini CLI, synced to `~/.gemini/GEMINI.md`.

Defines coding standards, preferences, and project-specific guidelines.
