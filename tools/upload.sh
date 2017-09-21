#!/bin/bash

# user@sshhost
SSHTARGET=$1
dir=$2

TOPDIR="www"
RESUMEDIR="r"

tgz="$dir.tgz"

function doit() {
    MYCOMMAND=$(echo "$1" | base64);
    ssh "${SSHTARGET}" "echo $MYCOMMAND | base64 -d | bash"
}

scp $tgz "${SSHTARGET}:${TOPDIR}/"
doit "cd ${TOPDIR} && tar -zxvhf $tgz && rm -rf ${RESUMEDIR} && ln -s $dir ${RESUMEDIR}"

echo $dir > latest-uploaded.txt
scp latest-uploaded.txt "${SSHTARGET}:${TOPDIR}/${RDIR}/latest.txt"



