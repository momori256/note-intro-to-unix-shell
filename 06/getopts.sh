#!/bin/sh

# command [-a] [-b value] arg...
A=FALSE
B=
OPT=
while getopts ab: OPT
do
  case $OPT in
  a)
    A=TRUE
    ;;
  b)
    B=$OPTARG
    ;;
  *)
    echo "Usage: $0 [-a] [-b value] arg..." 2>&1;
    exit 1
    ;;
  esac
done
shift `expr $OPTIND - 1` # $OPTIND indicates first arg.

echo "A=$A, B=$B"

i=1
for ARG in $@
do
  echo "\$$i=$ARG"
  i=`expr $i + 1`
done
