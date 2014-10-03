#!/bin/bash

# simple scp/ssh combo to copy privileged files
function dumbscp {
  local LOCAL="$1"
  local REMOTE="$2"

  local HOST="${REMOTE%:*}"
  local CANDIDATE="${REMOTE#*:}"
  local FILENAME="$(basename "$LOCAL")"

  local SSSH="ssh -o LogLevel=QUIET -t \"$HOST\""

  local TARGET="$($SSSH [ -f "$CANDIDATE" ] && echo "$CANDIDATE" || echo "${CANDIDATE%/}/$FILENAME")"
  local TEMP="$($SSSH mktemp)"

  echo "[dumbscp] $LOCAL => $HOST:$TARGET via $TEMP"

  scp "$LOCAL" "$HOST:$TEMP"
  $SSSH sudo cp $TEMP $TARGET && rm $TEMP
}
