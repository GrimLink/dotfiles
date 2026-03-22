---
Site: https://laravel.com/docs/valet
Updated: 2023-11-05
Requires: [brew, php, composer]
---

# Laravel

Laravel is my preferred way to set up a development environment on a local machine, such as macOS.

## Install

First, make sure you have completed the installation steps in install-system.sh to install PHP and Composer.

Then, run the following commands to install Valet and trust the local domain:

```sh
composer global require laravel/valet
valet install
valet trust
```

To test that everything is working, run the following command:

```sh
ping -c1 localhost.test
```

_This will ping the local domain and should return a 404 page._

## Database

The install script also sets up MySQL 8.4 (LTS), with the root password set to `root`.
