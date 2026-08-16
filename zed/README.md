---
Site: https://zed.dev/
Updated: 2026-08-16
---

# Zed

This contains all my personal Zed settings.

## Install

```sh
./zed/install.sh
```

> The Chrome DevTools MCP runs with its full tool set. `--slim` exposes only three tools and drops `take_snapshot` and `list_console_messages`, which the `a11y-audit` skill depends on. Requires the `chrome-devtools-mcp-zed` extension to be installed separately as it is not included by default.

## Setup

Syncs Zed settings to `~/.config/zed/`.

```sh
./zed/setup.sh
```

## CLI Options

For all options see: https://zed.dev/docs/reference/cli

## Prompts

The commit message is saved in a db file so this needs to be added manually.

Go to **Assistant Panel → Prompt Library → Commit Message**.

Replace this prompt with the one in `./prompt/commit-message.md`
