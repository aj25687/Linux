#!/bin/zsh

date >> script_audit.log
# echo Errors: >> script_audit.log
mkdir processed_logs/ 
mkdir quarantine/ 

cd ./raw_logs #reletive path, change to absolute
FILES= `find *.log`
find *.log
echo ${FILES}