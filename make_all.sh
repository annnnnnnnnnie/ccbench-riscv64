#/bin/bash

for folder in "strided" "caches"
do
  cd $folder
  make clean
  make
  cd -
done
