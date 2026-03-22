---
Site: https://developer.adobe.com/open/magento
Updated: 2026-03-22
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

The `install.sh` script sets up all required services for Magento2 development.

It installs and starts the following:

- Mailhog (mail catcher)
- Redis (cache)
- Opensearch (search engine)

It also configures Valet with the following (requires Valet to be installed):

- Sets the default PHP version to `php@8.4`
- Adds a proxy for Mailhog at `mailhog.test`
- Adds a proxy for Opensearch at `opensearch.test`
- Creates and parks `~/Developer/magento` as the default project folder
