#!/bin/sh

# Устанавливаем oh-my-zsh, если его нет
if [ ! -d ~/.oh-my-zsh ]; then
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

if [ ! -f $sources/my.zsh ]; then
  stream $themes/my.zsh > $sources/my.zsh
fi

if [ -d $ZSH/custom ]; then
  ln -s $sources/my.zsh $ZSH/custom/my.zsh
fi
