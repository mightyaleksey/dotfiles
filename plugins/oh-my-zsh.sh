#!/bin/sh

# Устанавливаем oh-my-zsh, если его нет
if [ ! -d ~/.oh-my-zsh ]; then
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

# Если нет файла, то облом :(
if [ ! -f ~/.zshrc ]; then
  exit
fi

# Если ссылка уже создана, то тоже ничего не делаем, так как нет оригинала
if [ -h ~/.zshrc ]; then
  exit
fi

mv ~/.zshrc $sources/.zshrc
stream $patches/.zshrc >> $sources/.zshrc
ln -s $sources/.zshrc ~/.zshrc
