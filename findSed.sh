#!/bin/bash/

read -p "Введите строку поиска: " search
read -p "Введите строку замены: " replace

directory = "."
if [ -d "$directory" ]; then
    for file in "$directory"/*; do
        if [ -f "$file" ] && [ -s "$file" ] && [ "${file##*.}" == "txt" ]; then
            if [[ $search != "" && $replace != "" ]]; then
                sed -i "s/$search/$replace/g" $file
            fi
        fi
    done
else
    echo "Директория $directory не существует"
fi