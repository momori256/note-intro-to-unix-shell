#!/bin/sh
if test $# -ne 1; then
  echo "[usage] $0 file"
  exit 0
fi

ed - $1 <<-EOF
g/^/m0
w
q
!
EOF
