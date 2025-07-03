#!/bin/zsh

set -euo pipefail

_link_path() {
  local path="$1"

  if [[ ! -d "$HOME/$(/usr/bin/dirname "$path")" ]]; then
    mkdir -p "$HOME/$(/usr/bin/dirname "$path")"
  fi

  /bin/ln -sf "$PWD/$path" "$HOME/$path"
  echo "Linked to $HOME/$path"
}


_link_path .zshrc
_link_path .gitconfig

# macOS only
if [[ "$(uname -s)" == "Darwin" ]]; then
  _link_path .aerospace.toml
  _link_path .config/karabiner/assets/complex_modifications/globe_to_f18.json
  _link_path .config/karabiner/assets/complex_modifications/mouse_buttons.json
  _link_path .config/karabiner/assets/complex_modifications/aerospace.json
  _link_path Library/Application\ Support/aichat/config.yaml
  _link_path Library/Application\ Support/Code/User/keybindings.json

  aerospace reload-config
fi
