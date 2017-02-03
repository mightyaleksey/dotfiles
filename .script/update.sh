#!/bin/sh

if [ -d ~/.oh-my-zsh ]; then
  for plugin in `ls .extention/oh-my-zsh`; do
    plugin_name=`echo $plugin|cut -d. -f1`

    mkdir -p ~/.oh-my-zsh/custom/plugins/${plugin_name}
    cp .extention/oh-my-zsh/${plugin} ~/.oh-my-zsh/custom/plugins/${plugin_name}/${plugin}
  done
fi
