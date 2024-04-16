#!/bin/bash
# Install bat & alias to cat
brew install bat

# TODO: Handle if .config alread not already exist?
ln -s $PWD/.config/wezterm $HOME/.config/wezterm
ln -s $PWD/.vimrc $HOME/.vimrc


# TODO Create custom .zshrc that contains alias cat='bat' 
ln -s /.zshrc  ~/.zshrc
