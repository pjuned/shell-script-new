#!/bin/bash

SOURCE_DIR=/tmp/shellscript_logs

if [ ! -d "$DIRECTORY" ]; then
  echo "$SOURCE_DIR does not exist."
fi

files_to_delete=$(find . -name "*.log" -type f -mtime +14 -delete)