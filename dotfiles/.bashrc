# .bashrc

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# colors
readonly OFF="\e[m"
readonly GREEN="\e[0;32m"
readonly ORANGE="\e[0;33m"

# history
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
shopt -s histappend

# git
. ~/git-completion.sh
. ~/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=1

# prompt
PROMPT_COMMAND='__git_ps1 "\n${GREEN}\u@\h${OFF} ${ORANGE}\w${OFF}" "\n\\\$ "'

# aliases
alias ll="ls -lhA"
alias irb="irb --noreadline"

# custom functions
. ~/.dotfiles/bash/authssh.sh
. ~/.dotfiles/bash/dumbscp.sh
