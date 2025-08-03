#!/usr/bin/env zsh

# Script to open associated application when switching to a workspace
# Usage: ./on_workspace_change.sh <workspace_name>

# Check if workspace name argument is provided
if [ $# -eq 0 ]; then
    exit 1
fi

WORKSPACE="$1"

open_app() {
    local app_path="$1"
    open "$app_path"
}

case "$WORKSPACE" in
    "B")
        open_app "/Applications/Bitwarden.app"
        ;;
    "C")
        open_app "/Applications/Visual Studio Code.app"
        ;;
    "D")
        open_app "/Applications/Discord.app"
        ;;
    "F")
        open ~
        ;;
    "M")
        open_app "/System/Applications/Mail.app"
        ;;
    "O")
        open_app "/Applications/Obsidian.app"
        ;;
    "P")
        open_app "/Applications/Postman.app"
        ;;
    "T")
        open_app "/Applications/Microsoft Teams.app"
        ;;
    "W")
        open_app "/Applications/Zen.app"
        ;;
    "Y")
        open_app "/Applications/YouTube Music.app"
        ;;
esac