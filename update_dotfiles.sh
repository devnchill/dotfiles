#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Enable debug output
set -x

# Paths
DOTFILES_DIR="/home/mid3ee/Desktop/CodeHaven/repos/dotfiles"

# Ensure all directories exist in the dotfiles repo
mkdir -p "$DOTFILES_DIR/fastfetch"
mkdir -p "$DOTFILES_DIR/cava"
mkdir -p "$DOTFILES_DIR/hypr"
mkdir -p "$DOTFILES_DIR/kitty"
mkdir -p "$DOTFILES_DIR/nvim"
mkdir -p "$DOTFILES_DIR/oh-my-zsh"
mkdir -p "$DOTFILES_DIR/spicetify"
mkdir -p "$DOTFILES_DIR/tmux"
mkdir -p "$DOTFILES_DIR/bin"
mkdir -p "$DOTFILES_DIR/waybar"
mkdir -p "$DOTFILES_DIR/swaync"

# Sync changes using rsync
rsync -av --delete --exclude '.git' "$HOME/.config/fastfetch/" "$DOTFILES_DIR/fastfetch/"
rsync -av --delete --exclude '.git' "$HOME/.config/cava/" "$DOTFILES_DIR/cava/"
rsync -av --delete --exclude '.git' "$HOME/.local/bin/" "$DOTFILES_DIR/bin/"
rsync -av --delete --exclude '.git' "$HOME/.config/hypr/" "$DOTFILES_DIR/hypr/"
rsync -av --delete --exclude '.git' "$HOME/.config/swaync/" "$DOTFILES_DIR/swaync/"
rsync -av --delete --exclude '.git' "$HOME/.config/kitty/" "$DOTFILES_DIR/kitty/"
rsync -av --delete --exclude '.git' "$HOME/.config/nvim/" "$DOTFILES_DIR/nvim/"
rsync -av --delete --exclude '.git' "$HOME/.config/waybar/" "$DOTFILES_DIR/waybar/"
rsync -av --delete --exclude '.git' "$HOME/.oh-my-zsh/" "$DOTFILES_DIR/oh-my-zsh/"
rsync -av --delete --exclude '.git' "$HOME/.config/spicetify/" "$DOTFILES_DIR/spicetify/"
rsync -av --delete --exclude '.git' "$HOME/.tmux/" "$DOTFILES_DIR/tmux/"
rsync -av --delete --exclude '.git' "$HOME/.config/VSCodium/User/keybindings.json" "$DOTFILES_DIR/keybindings.json"
rsync -av --delete --exclude '.git' "$HOME/.config/VSCodium/User/settings.json" "$DOTFILES_DIR/settings.json"
rsync -av --delete --exclude '.git' "$HOME/Desktop/CodeHaven/repos/dotfiles/update_dotfiles.sh" "$DOTFILES_DIR/update_dotfiles.sh"

# Copy individual files
cp "$HOME/.myalias" "$DOTFILES_DIR/myalias"
cp "$HOME/.config/VSCodium/User/keybindings.json" "$DOTFILES_DIR/keybindings.json"
cp "$HOME/.config/VSCodium/User/settings.json" "$DOTFILES_DIR/settings.json"
cp "$HOME/.tmux.conf" "$DOTFILES_DIR/tmux.conf"
cp "$HOME/.zshrc" "$DOTFILES_DIR/zshrc"

# Navigate to the repository directory
cd "$DOTFILES_DIR"

# Add changes to Git (including deletions)
git add --all

# Prompt for a commit message
read -p "Enter commit message: " commit_message

# Commit the changes with the provided message
git commit -m "$commit_message"

# Push the changes
git push origin main
