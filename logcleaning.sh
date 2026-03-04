#!/bin/zsh

date >> script_audit.log
echo Errors: >> script_audit.log
mkdir processed_logs/ 2>> script_audit.log 
mkdir quarantine/ 2>> script_audit.log

cd ./raw_logs #reletive path, change to absolute
echo Log Files:
FILES= $(find *.log) 2>> script_audit.log
find *.log


