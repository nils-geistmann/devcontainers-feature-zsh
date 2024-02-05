#!/usr/bin/env bash

assert_zsh_installed() {
  if ! which zsh; then
    exit 1
  fi
}

assert_oh_my_zsh_installed() {
  if [ -z "$ZSH" ]; then
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
