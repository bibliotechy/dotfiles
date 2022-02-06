#! /usr/bin/env bash

if [ ! -e ~/.local/fish ]; then 
  echo "Symlinking `pwd`/fish to $HOME/.local/"
  ln -sf `pwd`/fish $HOME/.local/
fi
