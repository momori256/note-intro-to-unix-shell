fcd() {
  if [ $# -eq 1 -a "$1" = "-h" ]; then
    echo "$0 - Find and cd to the directory."
    echo "USAGE: $0 [DIR]"
    return 0
  fi

  local DIR="."
  if [ $# -eq 1 ]; then
    DIR="$1"
  fi
  local DST=$(find "$DIR" -type d 2>/dev/null |
    sed -e '\%/\..*/%d' |
    fzf)
  if [ -d "$DST" -a -n "$DST" ]; then
    cd "$DST"
  fi
}
