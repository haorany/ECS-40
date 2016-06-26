#! /bin/bash
if [ -d $1 ] && [ -d $2 ] && [ $# -eq 3 ]; then
  for dir1file in $1/*; do
    for dir2file in $2/*; do
      if [ $dir2file == $dir1file ]; then
        if [ $dir2file -nt $dir1file ]; then
          cp $dir2file $3
        else
          cp $dir1file $3
        fi
      else 
        cp $dir2file $3
        cp $dir1file $3
      fi
    done
  done
else
  echo usage: cpdirs.sh source_directory1 source_directory2 dest_directory
  exit
fi
