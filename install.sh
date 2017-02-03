#!/bin/sh

homedir=~/.dotfiles

if [ ! -d "$homedir" ] || [ "$1" = '-f' ]; then
  test -d "$homedir" && rm -rf "$homedir"
  git clone --depth 1 git@github.com:sullenor/dotfiles.git "$homedir"
else
  echo "You have a dotfiles local copy at '${homedir}'."
  echo "Consider removing it first or use the '-f' flag."
fi
