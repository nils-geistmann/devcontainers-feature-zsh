#!/usr/bin/env bash

source dev-container-features-test-lib
source test_functions.sh

check "configured user should exist" assert_user_exists "remote"
check "configured user should be in group sudo" assert_user_is_in_group "remote" "sudo"
check "sudo should be available" assert_command_is_available "sudo"

reportResults
