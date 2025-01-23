#!/usr/bin/env bash
set -e

source functions.sh

check_and_install ca-certificates

# check if zsh is installed
if which zsh; then
  echo "ZSH is already installed. Great!"
else
  echo "ZSH needs to be installed"
  check_and_install zsh
fi

# set zsh as default shell for the remote user
chsh -s "$(which zsh)" "$_REMOTE_USER"

check_and_install curl git

if [ "$_REMOTE_USER" = "root" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
  USER_LOCATION="/root"
else
  #install OhMyZsh as the $_REMOTE_USER
  su - "$_REMOTE_USER" -c "sh -c $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
  USER_LOCATION="/home/$_REMOTE_USER"
fi

#install and set locales
if [ "$SETLOCALE" = "true" ]; then
  check_and_install locales
  echo "$DESIREDLOCALE" >>/etc/locale.gen
  locale-gen
fi

ZSH_RC_FILE="$USER_LOCATION/.zshrc"

if ! [ -f "$ZSH_RC_FILE" ]; then
  touch "$ZSH_RC_FILE"
fi

# set the theme
upsert_config_option "^ZSH_THEME=.*$" "ZSH_THEME=\"$THEME\"" "$ZSH_RC_FILE"

# set the default user
if [[ -n "$DEFAULTUSER" ]]; then
  upsert_config_option "^DEFAULT_USER=.*$" "DEFAULT_USER=\"$DEFAULTUSER\"" "$ZSH_RC_FILE"
fi

# configure the plugins
upsert_config_option "^plugins=\\(.*\\)$" "plugins=($PLUGINS)" "$ZSH_RC_FILE"

clean_package_cache
