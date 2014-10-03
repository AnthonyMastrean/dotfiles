#!/bin/bash

function authssh {
  local DOT_SSH="~/.ssh"
  local PUBLIC_KEY="$DOT_SSH/id_rsa.pub"
  local AUTHORIZED_KEYS="$DOT_SSH/authorized_keys"

  local HOST="$1"

  local SSSH="ssh -o LogLevel=QUIET -t \"$HOST\""

  [ -e "$PUBLIC_KEY" ] || return 1

  echo "[authssh] sending $PUBLIC_KEY to $HOST"

  cat "$PUBLIC_KEY" | $SSSH mkdir --parents "$DOT_SSH" && cat >> "$AUTHORIZED_KEYS" && chmod 700 "$DOT_SSH" && chmod 640 "$AUTHORIZED_KEYS"
}
