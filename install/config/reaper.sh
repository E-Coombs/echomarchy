#!/bin/bash

# Clone or update REAPER config from GitHub
REAPER_REPO="https://github.com/E-Coombs/REAPER"
REAPER_CONFIG_DIR="$HOME/.config/REAPER"

# Create .config directory if it doesn't exist
mkdir -p "$HOME/.config"

# Check if the REAPER config directory already exists
if [ -d "$REAPER_CONFIG_DIR" ]; then
    echo "REAPER config directory exists, updating..."
    cd "$REAPER_CONFIG_DIR"

    # Check if it's a git repository
    if [ -d ".git" ]; then
        git pull
    else
        echo "Warning: $REAPER_CONFIG_DIR exists but is not a git repository"
        echo "Skipping update. Please manually manage the directory or remove it to clone fresh."
    fi
else
    echo "Cloning REAPER config..."
    git clone "$REAPER_REPO" "$REAPER_CONFIG_DIR"
fi

echo "REAPER config installation complete"
