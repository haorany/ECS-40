#!/bin/bash

if test $# -eq 0
  then echo "usage: uncomp.sh {filelist}+"
  exit 1;
fi

while [ $# -gt 0 ]; do
  case $1 in
    *.tar) tar -xf $1 | sort -f;;
    *.tar.gz) tar -xzf $1 | sort -f;;
    *.gz) gzip -d $1 | sort -f;;
    *.zip) unzip -q $1 | sort -f;;
    *.tgz) tar -zxf $1 | sort -f;;
    *) echo "uncomp: $1 has no compression extension.";;
  esac

  shift
done # while
