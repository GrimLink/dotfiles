---
Site: https://ghostty.org/
Updated: 2026-08-17
---

# Ghostty

This contains all my personal Ghostty settings.

## Install

```sh
./ghostty/install.sh
```

This also creates `~/.hushlogin` if not present, suppressing the "Last login" message in new terminal sessions.

## Setup

Syncs `config.ghostty` to the Ghostty settings folder.

```sh
./ghostty/setup.sh
```

The file was called `config` before Ghostty 1.2.3. Both names still work, but
Ghostty loads `config` after `config.ghostty`, so a leftover would override the
synced settings. Setup removes it.

_Ghostty may need to be reloaded to add all changes._

