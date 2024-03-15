## OS Support

This feature currently only supports Debian based containers (where APT is used as package manager).

`bash` is required to run the install script.

## Remarks

When `create` is set to `true` and the user does not exist, the user is created and given a password that equals its name.

:warning:
If the user already exists, the password is not changed.
If no password is set, it is not possible to use `sudo`.
