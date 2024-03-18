#!/usr/bin/env bash

assert_command_is_available() {
  if ! which "$1"; then
    exit 1
  fi
}

assert_file_exists() {
  if [ ! -f "$1" ]; then
    exit 1
  fi
}

assert_file_not_exists() {
  if [ -f "$1" ]; then
    exit 1
  fi
}
