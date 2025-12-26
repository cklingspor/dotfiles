#!/bin/bash
set -e
# Install dependencies
brew install bat
brew install starship
brew install --cask ghostty

## Symlinks
# TODO: Handle if .config alread not already exist?
mkdir -p $HOME/.config
ln -s $PWD/.config/starship.toml $HOME/.config/starship.toml
ln -s $PWD/.vimrc $HOME/.vimrc

# vscode
# delete existing files
if [ -f "$HOME/Library/Application\ Support/Code/User/keybindings.json" ]; then
    rm "$HOME/Library/Application\ Support/Code/User/keybindings.json"
fi
ln -s $PWD/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json

if [ -f "$HOME/Library/Application\ Support/Code/User/settings.json" ]; then
    rm "$HOME/Library/Application\ Support/Code/User/settings.json"
fi
ln -s $PWD/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

# ghostty
mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
ln -s $PWD/Library/Application\ Support/com.mitchellh.ghostty/config "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

# TODO Create custom .zshrc that contains alias cat='bat'
ln -s $PWD/.zshrc  $HOME/.zshrc
