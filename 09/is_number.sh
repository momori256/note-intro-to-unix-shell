is_number() {
  if [ $# -lt 1 ]; then
    return 1
  fi

  expr "$1" + 1 >/dev/null 2>&1
  case $? in
    0 | 1 ) return 0 ;;
    *) return 1 ;;
  esac
}
