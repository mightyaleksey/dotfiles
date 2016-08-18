#!/bin/sh

dotfiles=~/.dotfiles

if [ -d "$dotfiles" ]; then
  printf "You already have dotfiles installed\n"
  exit
fi

git clone --depth=1 git@github.com:sullenor/dotfiles.git $dotfiles || {
  printf "git clone of dotfiles repo failed\n"
  exit 1
}
