# .bashrc

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# colors
readonly OFF="\e[m"
readonly GREEN="\e[0;32m"
readonly ORANGE="\e[0;33m"

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

# simple scp/ssh combo to copy privileged files
function dumbscp {
  local SSH_QUIET_TTY="ssh -o LogLevel=QUIET -t"

  local LOCAL="$1"
  local REMOTE="$2"

  local HOST="${REMOTE%:*}"
  local CANDIDATE="${REMOTE#*:}"
  local FILENAME="$(basename "$LOCAL")"
  local TARGET="$($SSH_QUIET_TTY "$HOST" [ -f "$CANDIDATE" ] && echo "$CANDIDATE" || echo "${CANDIDATE%/}/$FILENAME")"
  local TEMP="$($SSH_QUIET_TTY "$HOST" mktemp)"

  echo "[dumbscp] $LOCAL => $HOST:$TARGET via $TEMP"

  scp "$LOCAL" "$HOST:$TEMP"
  $SSH_QUIET_TTY "$HOST" "sudo cp $TEMP $TARGET && rm $TEMP"
}

function ssh_authorize {
  return 0
}
