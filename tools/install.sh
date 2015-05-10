#!/bin/sh
# Домашняя директория
cd `dirname $0`/../
DOTFILES=`pwd`

# Окружение
source ${DOTFILES}/tools/env.sh

stream() {
  sed \
    -e "s/\#{user}/$USER/" \
    -e "s/\#{email}/$EMAIL/" \
    $1
}

if [ ! -d $SOURCES ]; then
  mkdir -p $SOURCES
fi

echo 'Installing dotfiles to the home directory'
for config in `ls -A $CONFIGS`; do
  if [ ! -f ~/$config ]; then
    echo " - installing ~/$config"
    stream $CONFIGS/$config > $SOURCES/$config
    ln -s $SOURCES/$config ~/$config
  fi
done
