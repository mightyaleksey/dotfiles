#!/bin/sh
cd `dirname $0`
sources=`pwd`/sources

for config in `ls -A $sources`; do
  if [ -h ~/$config ] && [ -f $sources/$config ]; then
    rm ~/$config
    cp $sources/$config ~/$config
  fi
done

# Удаление oh-my-zsh
if [ -f ~/.oh-my-zsh/tools/uninstall.sh ]; then
  sh ~/.oh-my-zsh/tools/uninstall.sh
fi

if [ -f ~/.zshrc ]; then
  rm ~/.zshrc
fi
