#!/bin/sh

# Устанавливаем папку репозитория в качестве рабочей директории
cd `dirname $0`

# Нужные переменные
repository=`pwd`
configs=${repository}/configs
sources=${repository}/sources

: ${USER:=sullenor}
: ${EMAIL:=iamhoneyboy@gmail.com}


if [ ! -d $sources ]; then
  mkdir -p $sources
fi

for config in `ls -A $configs`; do
  if [ ! -f $sources/$config ]; then
    sed \
      -e "s/\#{user}/$USER/" \
      -e "s/\#{email}/$EMAIL/" \
      $configs/$config > $sources/$config
  fi
done
