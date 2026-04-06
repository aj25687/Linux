#!/bin/zsh

SOURCE_DIR="/Users/avantikajain/Downloads"
ARCHIVE_DIR="/Users/avantikajain/Downloads/Old_Archive"
DAYS_OLD=$1
BOOKS="BOOKS<3"

mkdir -p "$ARCHIVE_DIR"

print "Process: INITIATED!"

find "$SOURCE_DIR" -maxdepth 1 -type f \( -name "_*" -o -name "*.epub" -o -mtime +$DAYS_OLD \) | while read -r FILE; do

    FILENAME=$(basename "$FILE")
    EXT="${FILE:e:l}" 

    if [[ "$FILENAME" == *' ('[0-9]')'* ]]; then
        mkdir -p $ARCHIVE_DIR/Dupes
        mv "$FILE" "$ARCHIVE_DIR/Dupes"
    elif [[ "$FILENAME" == _* || "$EXT" == "epub" ]]; then
        mkdir -p $ARCHIVE_DIR/$BOOKS
        mv "$FILE" "$ARCHIVE_DIR/$BOOKS"
    else
        case "$EXT" in
            pdf|doc|docx|txt)
                mkdir -p $ARCHIVE_DIR/Documents 
                mv "$FILE" "$ARCHIVE_DIR/Documents"
                ;;
            jpg|jpeg|png|gif|svg|webp)
                mkdir -p $ARCHIVE_DIR/Images
                mv "$FILE" "$ARCHIVE_DIR/Images" ;;
            zip|tar|gz|dmg|apk|pkg)
                mkdir -p $ARCHIVE_DIR/ArchivesAndApps
                mv "$FILE" "$ARCHIVE_DIR/ArchivesAndApps" ;;
            mp3|mp4|mov)
                mkdir -p $ARCHIVE_DIR/SongsAndMovies
                mv "$FILE" "$ARCHIVE_DIR/SongsAndMovies" ;;
            java|class|py|sh|json|csv|c|heapsnapshot)
                mkdir -p $ARCHIVE_DIR/Coding
                mv "$FILE" "$ARCHIVE_DIR/Coding" ;;
            ipt|stl|gcode|step|f3d|obj)
                mkdir -p $ARCHIVE_DIR/3DPrinting
                mv "$FILE" "$ARCHIVE_DIR/3DPrinting" ;;
            docx|pptx|xlsx)
                mkdir -p $ARCHIVE_DIR/MSOfficeFiles
                mv "$FILE" "$ARCHIVE_DIR/MSOfficeFiles" ;;
            *) 
                mkdir -p $ARCHIVE_DIR/Miscellaneous
                mv "$FILE" "$ARCHIVE_DIR/Miscellaneous" ;;
        esac
    fi
done
print "YAY!"