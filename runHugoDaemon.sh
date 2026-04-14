#!/usr/bin/env bash
# --renderToMemory: avoid writing a full site tree under public/ on every reload (Hugo 0.123+).
# --appendPort=false: baseURL already includes the port.
exec hugo server -D -p 7001 --bind 127.0.0.1 \
  --baseURL=http://127.0.0.1:7001/ --appendPort=false --renderToMemory
