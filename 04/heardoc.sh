#!/bin/sh
VAR1=aaa
cat <<EOF
  This is a hear document.
  VAR1=$VAR1.
EOF

# espace.
cat <<\EOF
  This is a hear document.
  VAR1=$VAR1.
EOF

cat <<-EOF
  This is a hear document.
  VAR1=$VAR1.
EOF
