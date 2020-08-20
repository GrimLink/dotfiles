# Formating

All my formating and linting default config

## editorconfig

Base setup for editors.
To use the same indent and end of line, between team members.

**Source**
* http://editorconfig.org

## Prettier

Well Prettier is a zero config formatter.
I prefer single quotes for default javascript code.
And so use a supper small config.

**Source**
* https://prettier.io/


## Stylelint

The ESLint for CSS.

This version uses the npm pkg [@fylgja/stylelint-config](https://www.npmjs.com/package/@fylgja/stylelint-config).

So for the full code checkout the git repo.

```json
{
  "extends": "@fylgja/stylelint-config"
}
```

_I use the linting mostly via the editor plugin._

**Source**
* https://stylelint.io/
* https://github.com/shinnn/vscode-stylelint
* https://github.com/getfylgja/stylelint-config

## ESLint

I have not used ESLINT much yet in the wild so have nothing to add here (yet)
