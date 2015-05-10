#!/bin/sh
echo 'Removing oh-my-zsh'
if [ -f ~/.oh-my-zsh/tools/uninstall.sh ]; then
  sh ~/.oh-my-zsh/tools/uninstall.sh
fi
