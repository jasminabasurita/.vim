#!/bin/bash

ln -sf ~/.vim ~/.config/nvim

if ! [ -x "$(command -v nvim)" ]; then
  echo 'Neovim is not installed, attempting to install now...' >&2

  if [ -x "$(command -v dnf)" ]; then
    sudo dnf install neovim
  elif [ -x "$(command -v pacman)" ]; then
    sudo pacman -S neovim
  elif [ -x "$(command -v apt)" ]; then
    sudo apt install neovim
  elif [ -x "$(command -v brew)" ]; then
    brew install neovim
  else
    echo 'Error: Package manager not found. Please install Neovim manually.' >&2
    exit 1
  fi
fi

nvim --headless "+Lazy! install" +qa
