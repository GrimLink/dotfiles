#!/bin/bash

brew install gh
brew install imagemagick

# Mailhog
brew install mailhog

# TODO add `conf.d/smtp-mailhog.ini` to the instructions for both homebrew paths
# ```ini
# ; Use Mailhog for mail delivery
# sendmail_path=/opt/homebrew/bin/mailhog sendmail
# ```

# Frameworks specific tools
# brew install wp-cli
# brew install FriendsOfShopware/tap/shopware-cli
