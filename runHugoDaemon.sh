#!/usr/bin/env bash
# No --renderToMemory: for large sites it can use huge RAM and feel much slower (swap).
# Output goes to publishDir from config/development → .hugo/public (gitignored via .hugo/).
# --appendPort=false: baseURL already includes the port.
# Set HUGO_SERVER_NO_DRAFTS=1 to drop -D and speed up when you are not editing drafts.
DRAFTS=( -D )
[[ -n ${HUGO_SERVER_NO_DRAFTS:-} ]] && DRAFTS=()
exec hugo server "${DRAFTS[@]}" -p 7001 --bind 127.0.0.1 \
  --baseURL=http://127.0.0.1:7001/ --appendPort=false
