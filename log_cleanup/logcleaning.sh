#!/bin/zsh
echo --------------------------- >> script_audit.logs
date >> script_audit.logs
echo Errors: >> script_audit.logs
mkdir -p processed_logs/ 2>> script_audit.logs
mkdir -p quarantine/ 2>> script_audit.logs

cd /Users/avantikajain/Documents/GitHub/Linux/log_cleanup/raw_logs #reletive path, change to absolute
echo Log Files:
# FILES= $(find *.log) 2>> script_audit.logs
FILES=$(find *.log)
echo ${FILES}
NUMFILES=$(echo "${FILES}" | wc -l)
echo Number of Files: ${NUMFILES}

# --- Start Processing ---
echo "$FILES" | while read -r file; do
    [[ -z "$file" ]] && continue # checks if variable is empty

    content=$(cat "$file" | tr '[:lower:]' '[:upper:]') # make everything uppercase

    if echo "$content" | grep -q "UNAUTHORIZED"; then # look for unauthorized
        
        # Assuming format: [DATE] [USER] [IP] [ACTION]
        #2=username
        #3 - ip adress
        USER_DATA=$(echo "$content" | cut -d' ' -f2)
        IP_DATA=$(echo "$content" | cut -d' ' -f3)

        echo "$USER_DATA $IP_DATA" | paste - >> ../suspect_list.txt
        #dump all in suspect_list.txt

        #moving to quarantine
        mv "$file" ../quarantine/
        echo "ALERT: $file moved to quarantine." >> ../script_audit.logs
    else
        mv "$file" ../processed_logs/
        echo "CLEAN: $file moved to processed_logs." >> ../script_audit.logs
    fi
done

echo "Audit complete. Check suspect_list.txt and script_audit.logs."