#!/bin/sh

_IFS="$IFS"

while [ $# -gt 0 ]
do
  if [ \( ! -r $1 \) -o \( ! -f $1 \) ]
  then
    echo "$1 is not a readable file." 1>&2
    shift
    continue
  fi

  IFS=
  while read LINE
  do
    echo $LINE
  done < "$1"
  shift
done

IFS=$_IFS
