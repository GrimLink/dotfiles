# Formating

## General

### editorconfig

Base setup for editors.
To use the same indent and end of line, between team members.

**Source**
* http://editorconfig.org

### Prettier

Well Prettier is a zero config formatter.
I prefer single quotes for default javascript code.
And so use a supper small config.

**Source**
* https://prettier.io/

## Styles

### Stylelint

The ESLint for CSS.

This version is the same as [@fylgja/stylelint-config](https://www.npmjs.com/package/@fylgja/stylelint-config)
And I don't realy use the version in here.

Instead I `npm install` the fylgja stylelint-config
And then add a small `.stylelintrc` with the extend to the fylgja stylelint-config.

```json
{
  "extends": "@fylgja/stylelint-config"
}
```

I use the linting mostly via editor plugin.

**Source**
* https://stylelint.io/
* https://github.com/shinnn/vscode-stylelint
* https://github.com/getfylgja/stylelint-config

### sass-lint

**ARCHIVED**
So I really don't use it anymore

**Source**
* https://github.com/sasstools/sass-lint

## Javascript

### ESLint

_TODO: Create proper doc_
