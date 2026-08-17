---
Site: https://agents.md
Updated: 2026-08-17
---

# Agents

Shared configuration for AI coding agents, kept tool agnostic so more than one
agent can read it.

Everything here syncs to `~/.agents/`. Individual tools point at it rather than
holding their own copy, so instructions and skills are written once. Claude Code
symlinks `~/.claude/CLAUDE.md` and `~/.claude/skills` to this folder, wired up
by [claude](../claude/README.md).

## Setup

```sh
./agents/setup.sh
```

## AGENTS.md

Global instructions, synced to `~/.agents/AGENTS.md`.

Covers tone, documentation style, code comments, GitHub usage, commit message
format, and Magento conventions.

## Skills

Each skill lives in its own folder containing a `SKILL.md` file, which defines
the skill name, trigger description, and prompt body. They sync to
`~/.agents/skills/`.

### a11y-audit

Audits a web page against WCAG 2.2 Level AA using the Chrome DevTools MCP. Runs axe-core first, then the manual checks automation cannot make, including the WCAG 2.2 additions. Reports findings grouped by severity with element selectors and fixes.

### git-review

Reviews code changes for bugs, code quality, security, performance, and correctness. Fetches GitHub PRs via `gh` if a URL or PR number is provided, or asks for the diff directly when the source is unavailable.

### handoff

Compacts the current conversation into a handoff document so a fresh agent can pick up the work, written to the OS temporary directory rather than the workspace. References existing artifacts by path instead of repeating them, redacts secrets, and names the skills the next agent should call. Takes an optional description of what the next session is for. Invoked by name only.

### grilling

Interviews you relentlessly about a plan or design, treating it as a decision tree and asking a whole round of unblocked questions at a time, each with a recommended answer. Looks up facts itself rather than asking. From [Matt Pocock](https://github.com/mattpocock/skills).

### grill-me

Trigger phrase for `grilling`, kept because "grill me" is the natural thing to type. Does nothing on its own and is excluded from automatic invocation. From [Matt Pocock](https://github.com/mattpocock/skills).

### fylgja

Guidance on using the Fylgja CSS. Fetched from source during `setup.sh`. Author: [Fylgja CSS](https://github.com/fylgja/fylgja).

### ray-skill

Debugging with the [Ray](https://myray.app) desktop app by Spatie. Covers the full HTTP API for sending logs, tables, colors, labels, timing, and more. Inspired by [Freek Van der Herten](https://github.com/freekmurze).
