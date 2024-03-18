
# exercism (exercism)

A feature installing the Exercism CLI

## Example Usage

```json
"features": {
    "ghcr.io/nils-geistmann/devcontainers-features/exercism:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Version of the Exercism CLI | string | 3.3.0 |
| installCompletions | Whether or not to install a shell completion script for the cli | boolean | true |
| containerShell | Which shell to install the completions for - only `zsh` and `bash` are supported | string | zsh |

## The Working Directory

The Exercism CLI usually uses a working directory in the `$HOME` directory of the user.
To use the workspace directory of the devcontainer as Exercism's working directory, append the following to the `exercism configure` command: `--workspace="$(pwd)"`.

## OS Support

This feature currently only supports Debian based containers (where APT is used as package manager).
`bash` is required to run the install script.

## Processor Architecture Support

The Exercism CLI is provided as a native application for a variety of processor architectures.
This feature tries to determine the architecture of the current system and downloads the appropriate binary.
As there is currently no need to support architectures other than arm64 (e.g. Apple Silicon) and x86_64 these are the only supported architectures.
If more architectures are required, they can be added.

## Shell Completions

When using zsh, it is assumed that [Oh My Zsh](https://ohmyz.sh/) is used.

When using bash, the packages `bash-completion` and `pkg-config` are installed.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/nils-geistmann/devcontainers-features/blob/main/src/exercism/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
