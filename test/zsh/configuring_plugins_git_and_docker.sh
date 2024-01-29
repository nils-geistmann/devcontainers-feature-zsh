#!/usr/bin/env bash
set -e

source dev-container-features-test-lib
source test_functions.sh

check "plugins git and docker should be configured" assert_configured_plugins "git docker"

reportResults
