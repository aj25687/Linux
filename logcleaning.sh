#!/bin/zsh

date >> script_audit.logs
echo Errors: >> script_audit.logs
mkdir processed_logs/ 2>> script_audit.logs
mkdir quarantine/ 2>> script_audit.logs

cd ./raw_logs #reletive path, change to absolute
echo Log Files:
# FILES= $(find *.log) 2>> script_audit.logs
FILES=$(find *.log)
echo ${FILES}
let NUMFILES=$(echo ${FILES} | wc -l)
echo ${NUMFILES}