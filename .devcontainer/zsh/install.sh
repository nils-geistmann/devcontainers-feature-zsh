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

if [ "$_REMOTE_USER" = "root" ]; then
  USER_LOCATION="/root"
else
  USER_LOCATION="/home/$_REMOTE_USER"
fi

export ZSH="$USER_LOCATION/.oh-my-zsh"
echo "check if OhMyZsh is installed at $ZSH"
# ensure oh-my-zsh installed
if ! [ -d "$ZSH" ]; then
  echo "OhMyZsh was not found - starting installation"
  check_and_install wget git
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

ZSH_RC_FILE="$USER_LOCATION/.zshrc"

# set the theme
sed -i -e "s/^ZSH_THEME=.*$/ZSH_THEME=\"$THEME\"/" "$ZSH_RC_FILE"

# configure the plugins
sed -i -e "s/^plugins=\\(.*\\)$/plugins=($PLUGINS)/" "$ZSH_RC_FILE"
