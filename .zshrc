#!/bin/zsh

# %F (%f) start (stop) sequence to specificies foreground color
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#SEC59
# https://wiki.archlinux.org/index.php/zsh
# man zshmisc > SIMPLE PROMPT ESCAPES
PROMPT="%F{blue}%n%f %(4~|%-1~/../%2~|%~) %F{242}$%f "

# fix tab title in hyper.is
# https://zsh.sourceforge.io/Doc/Release/Functions.html#index-precmd
function gitDirty() {
  [[ $(git status 2> /dev/null | grep -o '\w\+' | tail -n1) != ("clean"|"") ]] && echo "*"
}
# show cwd when shell prompts for input.
function precmd() {
  current_dir=${$(pwd)##*/}
  print -Pn "\e]0;$current_dir$(gitDirty)\a"
}
# prepend command w/o arguments to cwd while waiting for command to complete.
function preexec() {
  printf "\033]0;%s\a" "${1%% *} | $current_dir$(gitDirty)"
}

# command history configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=2000
SAVEHIST=1000

# man zshoptions
setopt extended_history   # record timestamp of command in HISTFILE
setopt hist_ignore_dups   # ignore duplicated commands if they match the previous event
setopt inc_append_history # add commands to HISTFILE in order of execution

# `fn-delete` (forward delete)
# http://superuser.com/a/169930/165804
bindkey "^[[3~" delete-char

# `shift-tab` to reverse through completions menu
# http://stackoverflow.com/a/842370
bindkey '^[[Z' reverse-menu-complete

# list directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# file search functions
function f() {
  if [ "$#" -eq 0 ]; then
    echo 'f <pattern>'
    return
  fi

  find . -iname "*$1*" ${@:2}
}

function r() {
  if [ "$#" -eq 0 ]; then
    echo 'r <input>'
    return
  fi

  grep "$1" ${@:2} -R .
}

# remind common functions
function help() {
  echo "f - shortcur for find <pattern>"
  echo "r - shortcur for grep <input>"
}

# eval elisp code
function elisp() {
  if [ -f "$1" ]; then
    local file=$(cat "$1")
    emacs --batch --eval "$file"
  else
    emacs --batch --eval "$*"
  fi
}

# add homebrew to path
# https://brew.sh
if [ -d "/opt/homebrew/bin" ]; then
  export PATH="$PATH:/opt/homebrew/bin"
fi

# shortcut for the project local commands
export PATH="$PATH:./node_modules/.bin"
# shortcut for the global npm modules
# change npm's default directory to another directory
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
export PATH="$PATH:$HOME/.npm-global/bin"

# set alias to run emacs without GUI
alias em="emacs --no-window-system"
alias emacs="emacs --no-window-system"

# enable z (smarter cd)
if [ -f "/opt/homebrew/etc/profile.d/z.sh" ]; then
  source "/opt/homebrew/etc/profile.d/z.sh"
fi

# include local overrides
if [ -f "$HOME/.zshrc_local" ]; then
  source "$HOME/.zshrc_local"
fi
