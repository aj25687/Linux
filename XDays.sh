#!/bin/zsh

LINES=`ls -l | wc -l`
((LINES=LINES-1))
echo "FILES: ${LINES}"
DAYSAGO=$1

DATE=`ls -l | tr -s " " | cut -d" " -f6,7`
FILENAME=`ls -l | tr -s " " | cut -d" " -f9 `

CURDATE=`date +"%Y-%m-%d"`
#echo ${DATE}
#echo ${FILENAME}
#echo ${CURDATE}

# stat -f "%SB" -t "%Y-%m-%d" 30days.sh

NEWDIR="${DAYSAGO}DaysSince ${CURDATE}"
((DAYSAGO=DAYSAGO-1))
mkdir ${NEWDIR}

for i in {1..${LINES}}; do
    FILE=`echo ${FILENAME} | head -n $i | tail -n 1`
    BIRTH=`stat -f "%Sm" -t "%Y-%m-%d" ${FILE}`
    # DIFF=`datediff ${CURDATE} ${BIRTH} -f "%d days"`
    START=$(date -j -f "%Y-%m-%d" ${CURDATE} "+%s")
    END=$(date -j -f "%Y-%m-%d" ${BIRTH} "+%s")
    DIFF=$(( (START - END) / 86400 ))
    echo "${FILE} was created ${DIFF} days ago"
    if (( DIFF > ${DAYSAGO} )); then
        mv ${FILE} ${NEWDIR}
        print "\033[31m${FILE} has been moved. YAY!\033[0m" #red text!!!
    fi
    print "BIRTH: ${BIRTH}"
done
