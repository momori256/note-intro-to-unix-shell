fopen() {
  if [ $# -eq 1 -a "$1" = "-h" ]; then
    echo "$0 - Find and open the file."
    echo "USAGE: $0 [DIR]"
    return 0
  fi

  local DIR="."
  if [ $# -eq 1 ]; then
    DIR="$1"
  fi
  local DST=$(find "$DIR" -type f 2>/dev/null |
    sed -e '\%/\..*/%d' |
    fzf)
  if [ -f "$DST" -a -n "$DST" ]; then
    xdg-open "$DST"
  fi
}
