#!/bin/bash

# --- CONFIG ---
DOTFILES_DIR="$HOME/dotfiles"
set -e # Exit on error

echo "Linking configs..."

# Create folders if they don't exist
mkdir -p ~/.config

# Link files (f = force, s = symbolic)
ln -sf "$DOTFILES_DIR/zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/starship.toml" ~/.config/starship.toml
ln -sf "$DOTFILES_DIR/wezterm.lua" ~/.wezterm.lua

echo "Checking dependencies..."

# List of tools to check
apps=("starship" "zoxide" "fzf" "batcat" "eza")

for app in "${apps[@]}"; do
    if ! command -v "$app" &> /dev/null; then
        echo "$app missing. Installing..."
        if [ "$app" == "starship" ]; then
            curl -sS https://starship.rs/install.sh | sh -s -- -y
        elif [ "$app" == "batcat" ]; then
            sudo apt update && sudo apt install -y bat
            # Fix Ubuntu naming 'batcat' to 'bat'
            mkdir -p ~/.local/bin
            ln -sf /usr/bin/batcat ~/.local/bin/bat
        else
            sudo apt update && sudo apt install -y "$app"
        fi
    else
        echo "✓ $app found"
    fi
done

echo "Done. Restart zsh or run: source ~/.zshrc"
