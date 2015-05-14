#!/bin/sh
# Домашняя директория
cd `dirname $0`/../
DOTFILES=`pwd`

# Окружение
source ${DOTFILES}/tools/env.sh

# Парсинг аргументов командной строки
while [ $# -gt 0 ]; do
  option="$1"

  case $option in
  -e|--email)
    EMAIL="$2"; shift;;

  -u|--user)
    USER="$2"; shift;;

  -h|--help)
    echo
    echo '  Usage: install.sh [options]'
    echo
    echo '  Options:'
    echo
    echo '    -h, --help            output usage information'
    echo '    -u, --user <string>   sets the custom user name'
    echo '    -e, --email <string>  sets the custom email'
    echo
    exit;;
  esac

  shift
done

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

echo 'Installing plugins'
for plugin in $PLUGINS/*/install.sh; do
  plugin_dir=`dirname $plugin`
  source $plugin
done
