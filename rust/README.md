---
Site: https://rust-lang.org
Updated: 2026-03-29
---

# Rust

Installs Rust via [rustup](https://rustup.rs), the official Rust toolchain installer.

## Install

```sh
./rust/install.sh
```

This installs rustup and the stable Rust toolchain, then adds `. "$HOME/.cargo/env"` to `$HOME/.zshenv` so `cargo` and `rustc` are available in your shell.

## Updating

```sh
rustup update
```
