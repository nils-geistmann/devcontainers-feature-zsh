
# Create Remote User (create-remote-user)

A to assert the configured remote user exists in the container

## Example Usage

```json
"features": {
    "ghcr.io/nils-geistmann/devcontainers-features/create-remote-user:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| create | Create the user if it doesn't exist | boolean | true |
| addToSudo | If the user is newly created, add it to group sudo (if it exists) | boolean | true |
| installSudo | Install sudo if it is not yet installed | boolean | true |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/nils-geistmann/devcontainers-features/blob/main/src/create-remote-user/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
