#!/usr/bin/env bash
set -e

source dev-container-features-test-lib
source test_functions.sh

check "configured theme should be agnoster" assert_configured_theme_is "agnoster"

check "default user should not be set" assert_configured_default_user_is_not_set

reportResults
