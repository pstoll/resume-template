#!/bin/bash

dt=$(date '+%Y%m%d_%H%M%S');
dir="resume-$dt"
tgz="$dir.tgz"
mkdir $dir/ 
cp -r _site $dir/$dir # yes, duplicate
pushd $dir
  for ll in $(cat ../links.txt); do echo "linking $ll to $dir"; ln -s $dir $ll; done
popd
chmod -R 0755 $dir
gtar -zcvf $tgz $dir
echo $dir > latest-built.txt



