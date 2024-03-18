#!/usr/bin/env bash

set -e

source functions.sh

check_and_install curl tar gzip ca-certificates

echo "creating temporary download directory for Exercism CLI"
mkdir exercism
cd exercism

echo "downloaing and extracting Exercism CLI"
arch=$(uname -m)
echo "found architecture $arch"

if [ "$arch" = "aarch64" ]; then
    arch="arm64"
else
    arch="x86_64"
fi

downloadLink="https://github.com/exercism/cli/releases/download/v$VERSION/exercism-$VERSION-linux-$arch.tar.gz"
echo "downloading cli from $downloadLink"
curl -s -L "$downloadLink" | tar xz

echo "copying Exercism CLI to /usr/local/bin"
mv exercism /usr/local/bin

if [ "$INSTALLCOMPLETIONS" = "true" ]; then
    if [ "$CONTAINERSHELL" = "bash" ]; then
        install_completions_bash
    elif [ "$CONTAINERSHELL" = "zsh" ]; then
        install_completions_zsh
    else
        echo "$CONTAINERSHELL is not supported for completions. Please chose from [bash, zsh]."
    fi
fi

cd -
rm -rf exercism
clean_package_cache
