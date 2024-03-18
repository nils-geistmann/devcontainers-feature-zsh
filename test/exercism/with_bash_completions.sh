#!/usr/bin/env bash

source dev-container-features-test-lib
source test_functions.sh

check "Exercism CLI should be available" assert_command_is_available exercism
check "Exercism CLI should be available" assert_command_is_available pkg-config
check "Completions file is installed" assert_file_exists "$(pkg-config --variable=completionsdir bash-completion)/exercism.bash"

reportResults
