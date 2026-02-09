#!/bin/zsh

#SUDO CODE FOR THIS:
# get the contents of the file
# figure out how many lines are there
# in a loop of how many lines there are :
#   use wc -c to get the charecter count
#   find half of that
#   cut half of that line and store in a variable, and cut the other half of that line
#   (check; total three variables: charecter count, first half of line, second half of line)
#   print all three in this format: "("+char count+")"+first half+";"+second half

CONTENT= cat $1
LINES= wc -l $1
echo ${CONTENT} | head ${LINES} $1
# wc -c ${CONTENT} -> program just stops: why?
wc -c $1 | tr -d " "
wc -l $1 | tr -d " " #gives me two lines - why not three?, always gives me one LESS line
# answer for above: wc -l gives me the amount of NEW LINES, not the amount of lines, so technically will decrease it by one
