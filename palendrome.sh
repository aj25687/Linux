#!/bin/zsh
LINES=`wc -l "$1"  | tr -s " " | cut -d " " -f2`
print "Total Number of Lines : ${LINES}"
for i in {1..${LINES}}; do
    CONTENT=$(head -n $i $1 | tail -n 1 )
    let CHARCOUNT=`echo ${CONTENT} | wc -c | tr -d " "`
    REVERSED=$(echo -n "${CONTENT}" | rev)
    #print ${REVERSED}
    if(${CONTENT} -eq ${REVERSED}){
        print 
    }
done