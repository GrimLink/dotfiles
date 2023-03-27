#!/bin/bash

echo "This script will folow you through the steps needed to setup Larvavel valet 4"

# Make sure both brew, php and composer are installed
echo "Checking if all preparations are set"

if ! command -v php &> /dev/null; then
    echo "php not installed"
    exit 1;
else
    echo "✅ php"
fi

if ! command -v composer &> /dev/null; then
    echo "composer not installed"
    exit 1;
else
    echo "✅ composer"
fi

# Install step
echo "Installing valet"
composer global require laravel/valet
valet install

# Random test url, can be anything ending with .test
echo "Testing ping from valet"
ping -c1 localhost.test

echo "Setting ssh"
valet trust

echo "Setup Database"
echo -e "
Create in DBngin a mysql 5.7 service; with;
- name = mysql57
- port = 3306
- socket = /tmp/mysql.sock
- disable log = true
- auto start = true
"

echo "Run in tableplus in sql query the following;"

echo -e "ALTER USER ‘root’@’localhost’ IDENTIFIED BY ‘root’;
FLUSH PRIVILEGES;"

echo "For MySQL support in the CLi make sure to add the right export path"

echo "export PATH=/Users/Shared/DBngin/mysql/5.7.23/bin:\$PATH"

echo "DBngin docs: https://dbngin.com/"

read -rsn1 -p "When ready, press any key to continue";
echo "";

# Final steps
bash $(dirname "${BASH_SOURCE}")/proxy.sh;

echo "Done"