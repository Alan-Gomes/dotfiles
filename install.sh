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

  # =============================================================================
  # Dock Configuration
  # =============================================================================
  
  # Set Dock icon size
  defaults write com.apple.dock tilesize -int 36
  
  # Set Dock magnification size
  defaults write com.apple.dock largesize -int 54
  
  # Hide recent apps in Dock
  defaults write com.apple.dock show-recents -bool false
  
  # Auto-hide Dock
  defaults write com.apple.dock autohide -bool true
  
  # Remove auto-hide delay for instant showing
  defaults write com.apple.dock autohide-delay -float 0

  # =============================================================================
  # Keyboard Configuration
  # =============================================================================
  
  # Set fast key repeat rate
  defaults write -g KeyRepeat -int 4
  
  # Set short delay before key repeat starts
  defaults write -g InitialKeyRepeat -int 20

  # =============================================================================
  # Finder Configuration
  # =============================================================================
  
  # Show all filename extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  
  # Disable warning when changing file extensions
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  
  # Disable warning when removing files from iCloud Drive
  defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false
  
  # Show path bar in Finder windows
  defaults write com.apple.finder ShowPathbar -bool true

  # =============================================================================
  # Trackpad Configuration
  # =============================================================================
  
  # Enable tap to click for built-in trackpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  
  # Enable tap to click for external trackpad
  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

  # =============================================================================
  # Text Input Configuration
  # =============================================================================
  
  # Disable automatic capitalization
  defaults write -globalDomain NSAutomaticCapitalizationEnabled -bool false
  
  # Disable automatic period insertion after double space
  defaults write -globalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

  # =============================================================================
  # Mission Control Configuration
  # =============================================================================
  
  # Disable "displays to have separate spaces"
  defaults write com.apple.spaces spans-displays -bool true

  for app in "Dock" "Finder"; do
    killall "${app}" > /dev/null 2>&1
  done
fi

echo "Done. Note that some of these changes require a logout/restart to take effect."
