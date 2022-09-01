#!/bin/sh
echo "arguments: $#"

echo '1'
for i in "$@"; do
  echo $i
done

echo '2'
for i in "$*"; do
  echo $i
done

# if no arguments are passed, then use 'default'
echo '3'
for i in ${@:-default}; do
  echo $i
done

# if no arguments are passed, then use 'default'
echo '4'
for i in ${@:+"$@"}; do
  echo $i
done
