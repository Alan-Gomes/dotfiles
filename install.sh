#!/bin/zsh
_link_file() {
  local path="$1"

  /bin/ln -sf "$PWD/$path" "$HOME/$path"
}

_link_file .zshrc
_link_file .aerospace.toml
_link_file .gitconfig
_link_file Library/Application\ Support/aichat/config.yaml
_link_file Library/Application\ Support/Code/User/keybindings.json
