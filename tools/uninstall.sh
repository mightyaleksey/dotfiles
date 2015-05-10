#!/bin/sh
# Домашняя директория
cd `dirname $0`/../
DOTFILES=`pwd`

# Окружение
source ${DOTFILES}/tools/env.sh

echo 'Removing dotfiles from the home directory'
for config in `ls -A $CONFIGS`; do
  if [ -h ~/$config ] && [ "$SOURCES/$config" = "`readlink ~/$config`" ]; then
    echo " - removing ~/$config"
    rm ~/$config
  fi
done

if [ -f ~/.oh-my-zsh/tools/uninstall.sh ]; then
  echo 'Removing oh-my-zsh'
  sh ~/.oh-my-zsh/tools/uninstall.sh
fi

if [ -d $SOURCES ]; then
  echo 'Removing copy of the local dotfiles'
  rm -rf $SOURCES
fi
