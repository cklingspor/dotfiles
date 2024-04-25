#!/bin/bash
# Install bat & alias to cat
brew install bat

## Symlinks
# TODO: Handle if .config alread not already exist?
ln -s $PWD/.config/wezterm $HOME/.config/wezterm
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

# TODO Create custom .zshrc that contains alias cat='bat' 
ln -s $PWD/.zshrc  $HOME/.zshrc
