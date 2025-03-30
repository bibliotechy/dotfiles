#! /usr/bin/env bash

if [ ! -e ~/.config/fish ]; then 
  echo "Symlinking `pwd`/fish to $HOME/.confg/"
  ln -sf `pwd`/fish $HOME/.config/
fi
