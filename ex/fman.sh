fman() {
  if [ $# -eq 1 -a "$1" = "-h" ]; then
    echo "$0 - Find and open the man page."
    echo "USAGE: $0 PATTERN..."
    return 0
  fi

  local MAN=
  if [ $# -ge 1 ]; then
    # $1 = name, $2 = man section.
    MAN=`apropos -a "$@" | awk '{ print $1, $2 }'`
    for PAT in "$@"; do
      MAN=`echo "$MAN" | grep "$PAT"`
    done
    MAN=`echo "$MAN" | fzf`
  else
    MAN=`apropos ".*" | awk '{ print $1, $2 }' | fzf`
  fi

  if [ -z "$MAN" ]; then
    return 0
  fi

  NAME=`echo "$MAN" | awk '{print $1}'`
  SEC=`echo "$MAN" | awk '{print $2}' | sed -e 's/(\(.*\))/\1/'`
  man "$SEC" "$NAME"
}
