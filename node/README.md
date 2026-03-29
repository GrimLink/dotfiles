---
Site: https://nodejs.org
Updated: 2026-03-30
---

# Node

Installs Node and [pnpm](https://pnpm.io) via Homebrew, then sets sensible npm defaults and configures `.npmrc`.

## Install

```sh
./node/install.sh
```

## NVM

For Node version management, run `node/nvm.sh` to install [NVM](https://github.com/nvm-sh/nvm) and set up the LTS version as default. This also appends an auto-switch hook to `.zshrc` that reads `.nvmrc` files and switches the active Node version when changing directories.
