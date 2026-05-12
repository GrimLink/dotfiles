---
Site: https://developer.adobe.com/open/magento
Updated: 2026-05-12
---

# Magento2/Mage-OS

This adds some additional tools for [Magento2]/[Mage-OS].

Mainly adding my own script [mage](https://github.com/GrimLink/mage), for what mage adds please see the repo at https://github.com/GrimLink/mage

It also adds:

- [n98-magerun2](https://github.com/netz98/n98-magerun2),
  this will be available in your terminal as: `n98-magerun2`, `magerun2` or via mage as `mage run`
- [magento-cache-clean](https://github.com/mage2tv/magento-cache-clean),
  this will be available in your terminal as: `cache-clean.js -w` or via mage as `mage watch`

[Mage-OS]: https://mage-os.org/
[Magento2]: https://github.com/magento/magento2

## Install

Sets up all required services for Magento2 development. Installs and starts Mailhog, Redis, and Opensearch, and configures Valet with PHP 8.4, proxies, and the default project folder.

```sh
./magento/install.sh
```

## Setup

Installs the CLI tools: `mage`, `n98-magerun2`, and `magento-cache-clean`.

```sh
./magento/setup.sh
```
