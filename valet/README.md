---
Site: https://laravel.com/docs/valet
Updated: 2023-07-23
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

### Database

There are two ways to set up the database: with DBngin or manually.

I chose to set up the database manually, which is the option that is run by the `install.sh` script.

<details open><summary>The manually setup</summary>

1. Install MySQL with Homebrew:

```sh
brew install mysql
```

2. Start MySQL:

```sh
brew services start mysql
```

3. Set the MySQL password:

```sh
mysql -u root
```

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root'; FLUSH PRIVILEGES;
```

> Setup based on: https://sqlpad.io/tutorial/mysql-install-mac/

</details>

<details><summary>The DBngin setup</summary>

1. Install DBngin:

```bash
brew install --cask dbngin
```

2. Create a MySQL service in DBngin:

- name = mysql
- port = 3306
- socket = /tmp/mysql.sock
- disable log = true
- auto start = true

3. Add the following export path to your PATH environment variable:

```bash
export PATH=/Users/Shared/DBngin/mysql/5.7.23/bin:$PATH
```

4. Set the MySQL password:

```sh
mysql -u root
```

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root'; FLUSH PRIVILEGES;
```

</details>
