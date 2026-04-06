#!/bin/zsh
if [[ ! -f "$1" ]]; then
    print "Error: File not found."
    exit 1
fi
LINES=$(wc -l < "$1")
print "Total Number of Lines : ${LINES}"

for (( i=1; i<=${LINES}; i++ )); do
    CONTENT=$(head -n $i "$1" | tail -n 1)
    if [[ -z "$CONTENT" ]]; then
        continue
    fi
    REVERSED=$(echo -n "$CONTENT" | rev)
    if [[ "$CONTENT" == "$REVERSED" ]]; then
        print "Match: ${CONTENT} is a palindrome."
    else
        print "No Match: ${CONTENT}"
    fi
done