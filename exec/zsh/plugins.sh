#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

ui_start

sed -i.old "s/^plugins=(git).*/plugins=(\n  git\n)$i/g" "$HOME"/.zshrc

for i in "${GLD_omz_plugins[@]}"
do
  if [ ! -d "$HOME"/.oh-my-zsh/custom/plugins/"$i" ]; then
    exec_a=(git clone https://github.com/zsh-users/"$i".git "$HOME"/.oh-my-zsh/custom/plugins/"$i")
    exec_b=(sed -i.old "s/^plugins=(.*/plugins=(\n  $i/g" "$HOME"/.zshrc)

    ui_info "$i folder does not exist"

    ui_info "installing $i plugin"
    ui_cmd "${exec_a[@]}" ; "${exec_a[@]}"

    ui_info "write new plugin in $HOME/.zshrc"
    ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"
  else
    ui_info "$i folder exists; skipping plugin"
  fi
done

ui_done