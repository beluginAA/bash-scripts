#!/bin/bash

directory="."
output_directory="$directory"/empty_lines

mkdir -p "$output_directory"
if [ -d "$directory" ]; then
    for file in "$directory"/*; do
        if [ -f "$file" ] && [ -s "$file" ] && [ "${file##*.}" == "txt" ]; then
            first_line=$(sed -n '1p' "$file")
            second_line=$(sed -n '2p' "$file")
            if  [[ -z "$first_line" || -z "$second_line" ]]; then
                mv "$file" "output_directory/"
            fi
        fi
    done
    ls "$output_directory"
else
    echo "Директория $directory не существует"
fi
