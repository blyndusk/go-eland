#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

exec_a="curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -"
exec_b="echo 'deb https://baltocdn.com/helm/stable/debian/ all main' | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list"
exec_c="sudo apt update -y; sudo apt install helm -y"

ui_start

if [ "$(which helm)" != 0 ]; then
  ui_info "Downloadpublic signing key"
  ui_cmd "$exec_a" ; curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -

  ui_info "Add the Helm apt repository"
  ui_cmd "$exec_b" ; echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

  ui_info "Install Helm"
  ui_cmd "$exec_c" ; sudo apt update -y; sudo apt install kubectl -y
else
  ui_info "\"helm\" command already exist"
fi

ui_done