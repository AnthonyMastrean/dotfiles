# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
PS1="\n\e[0;32m\u@\h\e[m \e[0;33m\w\e[m\n\$ "

alias ls='ls -lhA'
alias df='df -h'
alias irb='irb --noreadline'
