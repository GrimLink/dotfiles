---
Site: https://nodejs.org
Updated: 2026-08-17
---

# Node

Installs Node, [pnpm](https://pnpm.io) and [nub](https://github.com/nubjs/nub) via Homebrew, then sets sensible npm defaults and configures `.npmrc`.

## Install

```sh
./node/install.sh
```

nub comes from `nubjs/tap`, which is not an official tap, so the install trusts
the formula first. See [the brew readme](../brew/README.md) for how that works.

## NVM

For Node version management, run `node/nvm.sh` to install [NVM](https://github.com/nvm-sh/nvm) and set up the LTS version as default. This also appends an auto-switch hook to `.zshrc` that reads `.nvmrc` files and switches the active Node version when changing directories.
