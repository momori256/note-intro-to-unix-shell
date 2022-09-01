fullname() {
  while [ $# -ge 1 ]
  do
    DIR=`pwd`
    if [ -d $1 ]; then
      cd $1
      pwd
    elif [ -f $1 ]; then
      cd `dirname $1`
      echo `pwd`/`basename $1`
    else
      echo $1
    fi
    shift
    cd $DIR
  done
}
