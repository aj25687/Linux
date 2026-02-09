#!/bin/zsh
LINES=`wc -l "$1"  | tr -s " " | cut -d " " -f2`
FINALRESULT="Total Number of Lines : ${LINES}"
let CHARCOUNT=0
let MIDNUM=0
for i in {1..${LINES}}; do
    CONTENT=$(head -n $i $1 | tail -n 1 )
    CHARCOUNT=`echo ${CONTENT} | wc -c | tr -d " "`
    MIDNUM=$((CHARCOUNT/2))
    FIRST_HALF=`echo ${CONTENT} | cut -c1-${MIDNUM}`
    ((MIDNUM=MIDNUM+1))
    SECOND_HALF=`echo ${CONTENT} | cut -c${MIDNUM}-`
    FINALRESULT="${FINALRESULT}
    (${CHARCOUNT})${FIRST_HALF};${SECOND_HALF}"
done
print ${FINALRESULT} | tee output.txt