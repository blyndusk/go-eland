#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/scripts/colors.sh
source "$PWD"/config/cfg.sh

fyellow "[-] starting..." ; sleep 1

sudo apt install "${_APT[*]}" -y

fgreen "[-] done !" ; sleep 1