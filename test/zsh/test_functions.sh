#!/usr/bin/env bash

assert_command_available() {
  if ! which "$1"; then
    exit 1
  fi
}

assert_zsh_installed() {
  assert_command_available zsh
}

assert_locales_installed() {
  assert_command_available locale-gen
}

assert_oh_my_zsh_installed() {
  if [ -z "$ZSH" ]; then
    echo "Variable ZSH is not set"
    exit 1
  fi

  if ! grep -E -q '^source .*/oh-my-zsh.sh$' ~/.zshrc; then
    exit 1
  fi
}

assert_default_shell_is_zsh() {
  bash -c "if ! [[ \"$SHELL\" =~ \"/zsh\"$ ]]; then exit 1; fi"
}

assert_configured_theme_is() {
  theme=$1
  if ! grep -E -q "^ZSH_THEME=\"$theme\"" ~/.zshrc; then
    exit 1
  fi
}

assert_configured_default_user_is() {
  theme=$1
  if ! grep -E -q "^DEFAULT_USER=\"$theme\"" ~/.zshrc; then
    exit 1
  fi
}

assert_configured_default_user_is_not_set() {
  if grep -q "^DEFAULT_USER=" ~/.zshrc; then
    exit 1
  fi
}

assert_configured_plugins() {
  plugins=$1
  if ! grep -E -q "^plugins=\\($plugins\\)" ~/.zshrc; then
    exit 1
  fi
}

assert_zshrc_exists() {
  if ! [ -f ~/.zshrc ]; then
    exit 1
  fi
}

assert_locale_available() {
  if ! locale -a | grep "$1"; then
    exit 1
  fi
}
