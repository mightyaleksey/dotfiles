#!/bin/sh
echo 'Installing oh-my-zsh'
if [ ! -d ~/.oh-my-zsh ]; then
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

# На случай, если ZSH еще не существует
: ${ZSH:=~/.oh-my-zsh}

if [ -d $ZSH/custom ]; then
  stream $plugin_dir/mine.zsh > $SOURCES/mine.zsh
  ln -s $SOURCES/mine.zsh $ZSH/custom/mine.zsh
fi
