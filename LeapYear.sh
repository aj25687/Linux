#!/bin/zsh

YEAR=$1
if (( YEAR > 1582 )); then
    if (( YEAR % 400 == 0 )); then
        print "YES"
    elif (( YEAR % 100 == 0 )); then
        print "NO"
    elif (( YEAR % 4 == 0 )); then
        print "YES"
    else
        print "NO"
    fi
else print "NO"
fi