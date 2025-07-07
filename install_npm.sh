#!/bin/zsh

_npm_install_if_not_exists() {
  local package_name="$1"
  if ! npm list --global "$package_name" --depth=0 >/dev/null 2>&1; then
    npm install --global "$package_name"
  fi
}

_pnpm_install_if_not_exists() {
  local package_name="$1"
  if ! pnpm list --global "$package_name" --depth=0 >/dev/null 2>&1; then
    pnpm install --global "$package_name"
  fi
}

_npm_install_if_not_exists pnpm
