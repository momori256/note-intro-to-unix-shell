#!/bin/sh
ps_sort() {
  ps | sort
}

f2() {
  # r=f2
  # r is 'abc\ndef', and $? is 15.
  echo abc
  echo def
  return 15
}

f3() {
  VAR1=xyz
  VAR2=VAR1
  eval echo $"$VAR2" # xyz
  # $"VAR2" is evaluated to $VAR1
}
