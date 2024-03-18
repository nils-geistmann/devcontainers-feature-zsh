#!/usr/bin/env bash
set -e

source functions.sh

if [ "$_REMOTE_USER" = "root" ]; then
  echo "Detected root to be the remote user - exiting feature installation."
  exit 0
else
  echo "Continuing feature installation for user $_REMOTE_USER"
fi

if [ "$CREATE" = "true" ] && ! id "$_REMOTE_USER"; then
  echo "User does not exist - starting creation"
  useradd -g users -m "$_REMOTE_USER"
  echo "$_REMOTE_USER:$_REMOTE_USER" | chpasswd
elif ! id "$_REMOTE_USER"; then
  echo "User does not exist - exiting feature installation."
  exit 0
fi

if [ "$ADDTOSUDO" = "true" ] && ! id -nG "$_REMOTE_USER" | grep -qw "sudo"; then
  echo "user is not in group 'sudo' - adding user to sudo"
  usermod -a -G sudo "$_REMOTE_USER"
fi

if [ "$INSTALLSUDO" = "true" ] && ! which sudo; then
  echo "sudo is not installed - starting installation"
  check_and_install sudo
fi

clean_package_cache
