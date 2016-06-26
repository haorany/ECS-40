#!/bin/bash

case $# in
  0|1)echo "ausage: grepdir.sh directory pattern [-grep option]*" 
      exit 1;;
esac

dir=$1
shift
pat=$1
shift

if test -d $dir
  then
    for argm in $*;do
      if [[ "${argm:0:1}" == "-" ]]
        then
          continue
      else 
        if test $# -eq 0
          then 
            find $dir -type f -exec grep $pat {} \;    
        else
          echo "usage: grepdir.sh directory pattern [-grep option]*"
          exit 1
        fi
      fi
    done
    
    find $dir -type f -exec grep $* $pat {} \;
else
  echo "usage: grepdir.sh directory pattern [-grep option]*"
  exit 1
fi
