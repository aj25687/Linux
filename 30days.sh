#!/bin/zsh

LINES=`ls -l | wc -l`
((LINES=LINES-1))
echo "FILES: ${LINES}"

DATE=`ls -l | tr -s " " | cut -d" " -f6,7`
FILENAME=`ls -l | tr -s " " | cut -d" " -f9 `

CURDATE=`date +"%Y-%m-%d"`
#echo ${DATE}
#echo ${FILENAME}
#echo ${CURDATE}

# stat -f "%Sm" -t "%Y-%m-%d" 30days.sh

for i in {1..${LINES}}; do
    FILE=`echo ${FILENAME} | head -n $i | tail -n 1`
    BIRTH=`stat -f "%Sm" -t "%Y-%m-%d" ${FILE}`
    # DIFF=`datediff ${CURDATE} ${BIRTH} -f "%d days"`
    START=$(date -j -f "%Y-%m-%d" ${CURDATE} "+%s")
    END=$(date -j -f "%Y-%m-%d" ${BIRTH} "+%s")
    echo "CREATED $(( (START - END) / 86400 )) DAYS AGO"
    print "BIRTH: ${BIRTH}"
done
