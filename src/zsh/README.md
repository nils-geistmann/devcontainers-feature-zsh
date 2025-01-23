
# zsh (zsh)

A feature to install and configure zsh with OhMyZsh

## Example Usage

```json
"features": {
    "ghcr.io/nils-geistmann/devcontainers-features/zsh:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| theme | The theme to be activated in .zshrc | string | robbyrussell |
| plugins | A space separated list of plugins to activate | string | git |
| setLocale | Install required locales package and set locale | boolean | true |
| desiredLocale | The locale that should be set when 'setLocale' is true | string | en_US.UTF-8 UTF-8 |
| defaultUser | Sets the DEFAULT_USER property in .zshrc | string | not set |

## OS Support

This feature currently only supports Debian based containers (where APT is used as package manager).

`bash` is required to run the install script.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/nils-geistmann/devcontainers-features/blob/main/src/zsh/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
