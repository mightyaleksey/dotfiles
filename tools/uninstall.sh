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

echo 'Removing plugins'
for plugin in $PLUGINS/*/uninstall.sh; do
  plugin_dir=`dirname $plugin`
  source $plugin
done

echo 'Removing copy of the local dotfiles'
if [ -d $SOURCES ]; then
  rm -rf $SOURCES
fi
