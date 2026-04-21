#!/bin/bash
DIR=$(dirname "$0")

REPO_URL="https://github.com/streetturtle/awesome-wm-widgets.git"
TARGET_DIR="$XDG_CONFIG_HOME/awesome/awesome-wm-widgets"

if [[ -d "$TARGET_DIR/.git" ]]; then
    echo "Updating awesome-wm-widgets in $TARGET_DIR"
    git -C "$TARGET_DIR" pull
else
    echo "Cloning awesome-wm-widgets into $TARGET_DIR"
    git clone "$REPO_URL" "$TARGET_DIR"
fi
