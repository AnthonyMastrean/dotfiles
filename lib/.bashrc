# .bashrc

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Colors
readonly OFF="\e[m"
readonly GREEN="\e[0;32m"
readonly ORANGE="\e[0;33m"

# git
. ~/git-completion.bash
. ~/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

# Shell prompt
PS1="\n${GREEN}\u@\h${OFF} ${ORANGE}\w${OFF}\$(__git_ps1)\n\$ "

# Aliases
alias ls='ls -lhA'
alias df='df -h'
alias irb='irb --noreadline'
