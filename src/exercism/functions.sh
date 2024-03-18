#!/usr/bin/env bash

# Checks if packages are installed and installs them if not
check_and_install() {
  for package in "$@"; do
    if ! dpkg -s "$package" >/dev/null 2>&1; then
      echo "$package is not installed - starting installation"
      if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
      fi
      apt-get -y install --no-install-recommends "$package"
    fi
  done
}

# Cleans APT's cache to keep devcontainer layers small
clean_package_cache() {
  apt-get clean
}

install_completions_bash() {
  echo "installing shell completions for Exercism CLI"
  check_and_install bash-completion pkg-config
  completionsDir="$(pkg-config --variable=completionsdir bash-completion)"
  echo "found bash completions dir at $completionsDir"
  mkdir -p "$completionsDir"
  mv ./shell/exercism_completion.bash "$completionsDir/exercism.bash"
}

install_completions_zsh() {
  completionsDir="$(get_oh_my_zsh_path)/completions"
  echo "installing shell completions for Exercism CLI to $completionsDir"
  mkdir -p "$completionsDir"
  mv ./shell/exercism_completion.zsh "$completionsDir/_exercism"
  chown -c "$_REMOTE_USER" "$completionsDir/_exercism"
}

get_oh_my_zsh_path() {
  if [ -z "$ZSH" ]; then
    if [ "$_REMOTE_USER" = "root" ]; then
      echo "/root/.oh-my-zsh"
    else
      echo "/home/$_REMOTE_USER/.oh-my-zsh"
    fi
  else
    echo "$ZSH"
  fi
}
