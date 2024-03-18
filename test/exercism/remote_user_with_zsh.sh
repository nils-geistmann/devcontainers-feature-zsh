#!/usr/bin/env bash

source dev-container-features-test-lib
source test_functions.sh

check "Exercism CLI should be available" assert_command_is_available exercism
check "Completions file is installed" assert_file_exists "/home/exercism-zsh/.oh-my-zsh/completions/_exercism"

reportResults
