---
Site: https://laravel.com/docs/valet
Updated: 2026-08-16
Requires: [brew, php, composer]
---

# Laravel

Laravel is my preferred way to set up a development environment on a local machine, such as macOS.

## Install

Requires PHP and Composer to be installed first (via `install-system.sh`). Installs Valet, trusts the local domain, sets up Mailpit and calls `database.sh` for the database.

```sh
./valet/install.sh
```

## Database

Installs MariaDB 11.8 (LTS) with the root password set to `root`. Runs as part of `install.sh`, but can also be run on its own to add or repair the database.

```sh
./valet/database.sh
```

MariaDB replaces MySQL here because Magento 2.4.7 no longer supports MySQL at all and 2.4.8 caps it at 8.4, while MariaDB 11.8 covers both versions. Both databases claim port 3306 and the `var/mysql` data directory, so the script asks you to remove any existing MySQL install before it continues.

## Migrate

Moves an existing MySQL install over to MariaDB, for machines that were set up before this change.

```sh
./valet/database-migrate.sh
```

It dumps every database to `~/valet-database-backup-<date>`, uninstalls MySQL, deletes the old data directory and the MySQL `my.cnf`, runs `database.sh` and imports the dumps again. The uninstall and the delete cannot be undone, so it asks for confirmation first. Port, user and password stay the same (`root`/`root`), which means `app/etc/env.php` does not need to change.

When a run stops halfway, point it at the folder it already made to skip the dump and pick up at the install.

```sh
./valet/database-migrate.sh ~/valet-database-backup-20260816-191147
```

## Setup

Syncs Valet configuration files.

```sh
./valet/setup.sh
```
