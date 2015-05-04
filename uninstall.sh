#!/bin/sh
cd `dirname $0`
sources=`pwd`/sources

for config in `ls -A $sources`; do
  if [ -h ~/$config ] && [ -f $sources/$config ]; then
    rm ~/$config
    cp $sources/$config ~/$config
  fi
done
