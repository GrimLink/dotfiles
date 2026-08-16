---
Site: https://developers.google.com/gemini-code-assist
Updated: 2026-08-16
---

# Gemini CLI

> [!WARNING]
> Archived. On June 18 Google [announced the transition of Gemini CLI to Antigravity CLI](https://developers.googleblog.com/an-important-update-transitioning-gemini-cli-to-antigravity-cli/),
> which dropped support for Google One and free tier users.
> These settings are kept for reference only and are no longer part of `install-dev-env.sh` or `sync-settings.sh`.

This contains all my personal Gemini CLI settings.

## Install

Installs Gemini CLI and configures the Chrome DevTools MCP with its full tool set. `--slim` exposes only three tools and drops `take_snapshot` and `list_console_messages`, which the `a11y-audit` skill depends on.

```sh
./_Archive/gemini/install.sh
```

## Setup

Syncs settings and `GEMINI.md` to `~/.gemini/`.

```sh
./_Archive/gemini/setup.sh
```

## Settings

Global Gemini CLI settings synced to `~/.gemini/settings.json`.

Contains default permissions and behavior preferences.

## GEMINI.md

Global instructions for Gemini CLI, synced to `~/.gemini/GEMINI.md`.

Defines coding standards, preferences, and project-specific guidelines.
