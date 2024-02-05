#!/usr/bin/env bash
set -e

source dev-container-features-test-lib
source test_functions.sh

check "zshrc file should exist" assert_zshrc_exists
check "configured theme should be avit" assert_configured_theme_is "avit"
check "plugins git and docker should be configured" assert_configured_plugins "git docker"

reportResults
