---
Site: https://brew.sh/
Updated: 2026-08-17
---

# Homebrew

Homebrew is my go-to package manager. If I can install something with Homebrew, I will.

Most tools and apps I use are listed in the `Brewfile` and installed via `brew bundle`.

## Install

```sh
./brew/install.sh
```

## Whats inside

See `Brewfile` for the full list of packages and apps.

## Trusted taps

Homebrew will not load formulae, casks or commands from a non official tap
until they are trusted. Declare that on the `tap` line so `brew bundle install`
sets it up, instead of running `brew trust` by hand on every machine.

```ruby
tap "localsend/localsend", trusted: { casks: ["localsend"] }
```

Use `formulae:` or `commands:` for the other kinds, or `trusted: true` to trust
everything a tap ships, now and later.

Trust lives in `~/.homebrew/trust.json`. Be aware that a forced
`brew bundle cleanup` rewrites that file to match the Brewfile, dropping any
tap trusted by hand but not listed here.
