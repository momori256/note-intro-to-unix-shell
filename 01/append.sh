#!/bin/sh
case $# in
  1 ) cat >> $1 ;;
  2 ) cat $1 >> $2 ;;
  * ) echo "Usage: append [srcfile] dstfile" 1>&2 ;;
esac
