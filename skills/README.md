---
Updated: 2026-03-27
---

# Skills

My personal global skills for Claude Code, synced to `~/.claude/skills/`.

Each skill lives in its own folder containing a `SKILL.md` file, which defines the skill name, trigger description, and prompt body.

## Install

Run `setup.sh` to sync all skills to `~/.claude/skills/`:

```sh
./skills/setup.sh
```

## Skills

### grill-me

Interviews you relentlessly about a plan or design, walking through every branch of the decision tree one question at a time.

### git-review

Reviews code changes for bugs, code quality, security, performance, and correctness. Fetches GitHub PRs via `gh` if a URL or PR number is provided, or asks for the diff directly when the source is unavailable.

### a11y-audit

Audits a web page for accessibility issues using the browser MCP. Reports findings grouped by severity with element selectors and fixes. Requires the Chrome DevTools MCP to be configured.
