#!/bin/bash

directory="."
output_file="output.txt"

if [ -d "$directory" ]; then
    for file in "$directory"/*; do
        if [ -f "$file" ] && [ -s "$file" ] && [ "${file##*.}" == "txt" ]; then
            first_line=$(sed -n '1p' "$file")
            second_line=$(sed -n '2p' "$file")
            echo "$first_line" >> "$output_file"
            echo "$second_line" >> "$output_file"
            echo "" >> "$output_file"
        fi
    done
else
    echo "Директория $directory не существует"
fi
