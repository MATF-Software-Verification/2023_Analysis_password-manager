#!/bin/bash

if ! command -v gprof2dot &> /dev/null || ! command -v dot &> /dev/null
then
    echo "gprof2dot ili Graphviz nisu instalirani."
    exit 1
fi

callgrind_files=("callgrind_output/callgrind_gui.out" "callgrind_output/callgrind_copy_saved_password.out" "callgrind_output/callgrind_generate_and_copy_password.out" "callgrind_output/callgrind_print_all_passwords.out" "callgrind_output/callgrind_search_passwords.out")

mkdir -p graphs

for file in "${callgrind_files[@]}"
do
    if [[ -f "$file" ]]; then
        base_name=$(basename "$file" .out)
        
        output_image="graphs/$(echo "$base_name" | sed 's/^callgrind_//').png"

        echo "Generating $output_image..."
        gprof2dot -f callgrind "$file" | dot -Tpng -o "$output_image"
        echo "Saved as $output_image"
    else
        echo "No such file $file."
    fi
done

echo "Finished."



