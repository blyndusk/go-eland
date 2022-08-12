#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh

sudo apt update -y

if [ "$(echo "$SHELL" | grep "zsh")" != 0 ]; then
  zsh
fi