# setup Laravel Valet 4

Make sure both brew, php and composer are installed

```bash
composer global require laravel/valet
valet install
valet trust
```

To test if everthing works;

```bash
ping -c1 localhost.test # random test url, can be anything ending with .test
ping -c1 localhost.test:9200 # eleasticsearch
ping -c1 mailhog.test # mailhog
```

## Database

Create in DBngin a mysql 5.7 service; with;

port = 3306

To install a database use;

```bash
brew install --cask dbngin
brew install --cask tableplus
brew install --cask sequel-ace
```

Run in tableplus in sql query the following;

```sql
ALTER USER ‘root’@’localhost’ IDENTIFIED BY ‘root’;
FLUSH PRIVILEGES;
```

```bash
ln -s /tmp/mysql_3306.sock /tmp/mysql.sock
```

## php

```bash
brew tap nicoverbruggen/homebrew-cask
brew install --cask phpmon
```

## Redis

```bash
brew install redis
```

## Mailhog

```bash
brew install mailhog
```

To create an easy domain name use;

```bash
valet proxy mailhog http://localhost:8025 --secure
```

## Opensearch

```bash
brew install opensearch
```

To create an easy domain name use;

```bash
valet proxy opensearch http://localhost:9200 --secure
```
