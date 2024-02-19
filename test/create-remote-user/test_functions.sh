#!/usr/bin/env bash

assert_user_exists() {
  if ! id "$1"; then
    exit 1
  fi
}

assert_user_is_in_group() {
  if ! id -nG "$1" | grep -qw "$2"; then
    exit 1
  fi
}

assert_user_is_not_in_group() {
  if id -nG "$1" | grep -qw "$2"; then
    exit 1
  fi
}

assert_command_is_available() {
  if ! which "$1"; then
    exit 1
  fi
}

assert_command_is_not_available() {
  if which "$1"; then
    exit 1
  fi
}
