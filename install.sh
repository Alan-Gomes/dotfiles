#!/bin/zsh

set -euo pipefail

_link_path() {
  local file_path="$1"
  local source_path="$PWD/$file_path"
  local target_path="$HOME/$file_path"

  if [[ ! -d "$(/usr/bin/dirname "$target_path")" ]]; then
    mkdir -p "$(/usr/bin/dirname "$target_path")"
  fi

  /bin/ln -sf "$source_path" "$target_path"
  echo "Linked to $target_path"
}


_link_path .zshrc
_link_path .gitconfig

if [[ "$(uname -s)" == "Darwin" ]]; then
  . ./install_macos.sh
fi

if command -v npm &> /dev/null; then
  . ./install_npm.sh
fi

echo "Done. Note that some of these changes require a logout/restart to take effect."
