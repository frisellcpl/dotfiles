#!/bin/bash

if [ "$#" -eq 1 ];then
    PASSWORD_STORE_DIR="${HOME}/.$1"
    cd $PASSWORD_STORE_DIR
    find * -path '*/.git*' -prune \
         -o -follow -type f -exec sh -c 'printf "%s\n" 
"${0%.*}"' {} ';'
else
    coproc PASSWORD_STORE_DIR="${HOME}/.$1" pass -c $2
fi
