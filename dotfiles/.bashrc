#!/bin/bash

# .bashrc
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# bash
export EDITOR=notepad

# forward-search
stty -ixon

# colors
readonly OFF='\e[m'
readonly GREEN='\e[0;32m'
readonly ORANGE='\e[0;33m'

# history
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000

shopt -s \
    histappend \
    histreedit \
    histverify

# git
. ~/dotfiles/bin/git-completion.bash
. ~/dotfiles/bin/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM='auto'
export GIT_PS1_SHOWCOLORHINTS=1

function __my_ps1 {
  if [[ -z $(git config prompt.ignore) ]];
  then
    __git_ps1 "$PROMPT_PRE" "$PROMPT_POST"
  fi
}

# prompt
readonly PROMPT_PRE="\n${GREEN}\u@\h${OFF} ${ORANGE}\w${OFF}"
readonly PROMPT_POST="\n\\\$ "

export PROMPT_COMMAND=__my_ps1

# aliases
alias ll='ls -lhA'
alias irb='irb --noreadline'
