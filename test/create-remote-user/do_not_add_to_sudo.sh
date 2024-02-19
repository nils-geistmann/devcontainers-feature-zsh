#!/usr/bin/env bash

source dev-container-features-test-lib
source test_functions.sh

check "configured user should exist" assert_user_exists "remote"
check "configured user should not be in group sudo" assert_user_is_not_in_group "remote" "sudo"
check "sudo should not be available" assert_command_is_not_available "sudo"

reportResults
