#!/bin/sh

# colors
COLOR_NC='\033[0m'
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_LIGHT_GRAY='\033[0;37m'
COLOR_BOLD='\033[1m'

# plugin_file -> plugin_name
udpate_plugin() {
  mkdir -p ~/.oh-my-zsh/custom/plugins/${2}
  cp .extention/oh-my-zsh/${1} ~/.oh-my-zsh/custom/plugins/${2}/${1}

  echo "${COLOR_LIGHT_GRAY}~/.oh-my-zsh/custom/plugins/${2}/${1} ${COLOR_GREEN}done${COLOR_NC}"
}

if [ -d ~/.oh-my-zsh ]; then
  echo 'updating oh-my-zsh plugins'

  for plugin_file in `ls .extention/oh-my-zsh`; do
    plugin_name=`echo $plugin_file|cut -d. -f1`
    udpate_plugin $plugin_file $plugin_name
  done
else
  echo "updating oh-my-zsh plugins ${COLOR_BOLD}skipped${COLOR_NC}"
  echo "${COLOR_LIGHT_GRAY}oh-my-zsh was not found${COLOR_NC}"
fi
