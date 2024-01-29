#!/usr/bin/env bash

source dev-container-features-test-lib
source test_functions.sh

check "zsh should be installed" assert_zsh_installed
check "OhMyZsh should be installed" assert_oh_my_zsh_installed

check "default shell should be zsh" assert_default_shell_is_zsh

check "configured theme should be robbyrussell" assert_configured_theme_is "robbyrussell"

check "plugin git should be configured" assert_configured_plugins "git"

reportResults
