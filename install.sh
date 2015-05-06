#!/bin/sh

# Устанавливаем папку репозитория в качестве рабочей директории
cd `dirname $0`

# Нужные переменные
repository=`pwd`
configs=${repository}/configs
plugins=${repository}/plugins
sources=${repository}/sources

: ${USER:=sullenor}
: ${EMAIL:=iamhoneyboy@gmail.com}


# Создаем папку для локальной копии конфигов
if [ ! -d $sources ]; then
  mkdir -p $sources
fi

# Копируем + Патчим конфиги
for config in `ls -A $configs`; do
  if [ ! -f $sources/$config ]; then
    sed \
      -e "s/\#{user}/$USER/" \
      -e "s/\#{email}/$EMAIL/" \
      $configs/$config > $sources/$config
  fi

  if [ ! -f $configs/$config ]; then
    ln -s $sources/$config ~/$config
  elif [ "$sources/$config" != "`readlink ~/$config`" ]; then
    rm ~/$config
    ln -s $sources/$config ~/$config
  fi
done

# Запускаем плагины
for plugin in `ls -A $plugins`; do
  source $plugins/$plugin
done
