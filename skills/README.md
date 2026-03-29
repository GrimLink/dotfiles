---
Updated: 2026-03-29
---

# Skills

My personal global AI skills, shared across Claude Code and Gemini CLI.

Each skill lives in its own folder containing a `SKILL.md` file, which defines the skill name, trigger description, and prompt body.

Skills are synced to `~/.agents/skills/` as the primary location. Claude Code reads from `~/.claude/skills/`, which is symlinked to `~/.agents/skills/`. Gemini CLI reads from `~/.agents/skills/` natively.

## Install

```sh
./skills/setup.sh
```

## Skills

### a11y-audit

Audits a web page for accessibility issues using the browser MCP. Reports findings grouped by severity with element selectors and fixes. Requires the Chrome DevTools MCP to be configured.

### git-review

Reviews code changes for bugs, code quality, security, performance, and correctness. Fetches GitHub PRs via `gh` if a URL or PR number is provided, or asks for the diff directly when the source is unavailable.

### grill-me

Interviews you relentlessly about a plan or design, walking through every branch of the decision tree one question at a time. Inspired by [Matt Pocock](https://github.com/mattpocock).

### fylgja

Guidance on using the Fylgja CSS. Fetched from source during `setup.sh`. Author: [Fylgja CSS](https://github.com/fylgja/fylgja).

### ray-skill

Debugging with the [Ray](https://myray.app) desktop app by Spatie. Covers the full HTTP API for sending logs, tables, colors, labels, timing, and more. Inspired by [Freek Van der Herten](https://github.com/freekmurze).
