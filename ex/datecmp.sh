datecmp() {
  if [ $# -ne 2 ]; then
    echo "compare the update date of two files." 1>&2
    echo "usage: $0 file1 file2" 1>&2
    return 1
  fi

  DATE1=$(date -d "$(ls "$1" --full-time | awk '{print $6, $7}')" '+%s')
  DATE2=$(date -d "$(ls "$2" --full-time | awk '{print $6, $7}')" '+%s')

  if test "$DATE1" -gt "$DATE2"
  then
    echo 1
  elif test "$DATE1" -eq "$DATE2"
  then
    echo 0
  else
    echo -1
  fi
  return 0
}
