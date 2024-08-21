#!/bin/bash

source_dir="../password-manager/source/console"
output_file="clang-tidy_output.txt"
include_dir="../password-manager/include"

> "$output_file"

for file in "$source_dir"/*.c; do
    if [ -f "$file" ]; then
        echo "Analiziram fajl: $file" | tee -a "$output_file"
        clang-tidy "$file" -- -I"$include_dir" 2>&1 | tee -a "$output_file"
        echo "" >> "$output_file" 
    fi
done

echo "Analiza završena. Izlaz je sačuvan u $output_file"
