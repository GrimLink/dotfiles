# NODE/NPM

The setup for global config and pkg's

_NODE needs to be installed via Brew or NVM._
_Since there is no sudo for the setup_

## What's in the 📦

The setup will install;

* Auditing
  * [lighthouse](https://github.com/GoogleChrome/lighthouse)
  * [hint]()
  * [wallace-cli, CSS audint]()
* Compilers/Bundlers
  * [gulp-cli](https://gulpjs.com/)
  * [@vue/cli](https://cli.vuejs.org/guide/installation.html)
  * [@gridsome/cli]()
  * [gatsby-cli]()
* # Node Tools
  * [np, A better `npm publish`](https://github.com/sindresorhus/np)

And the setup will set the following config

`npm list` will no by default show a dept of 0.
Run `npm list --dept` to see more.

Set a defaults for npm init

* Author name base on your git config username
* License is now by default MIT
