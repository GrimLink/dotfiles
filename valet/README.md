---
Site: https://laravel.com/docs/valet
Updated: 2026-05-12
Requires: [brew, php, composer]
---

# Laravel

Laravel is my preferred way to set up a development environment on a local machine, such as macOS.

## Install

Requires PHP and Composer to be installed first (via `install-system.sh`). Installs Valet, trusts the local domain, and sets up MySQL 8.4 (LTS) with the root password set to `root`.

```sh
./valet/install.sh
```

## Setup

Syncs Valet configuration files.

```sh
./valet/setup.sh
```
