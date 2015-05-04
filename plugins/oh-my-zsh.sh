#!/bin/sh

# Устанавливаем oh-my-zsh, если его нет
if [ ! -d ~/.oh-my-zsh ]; then
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi
