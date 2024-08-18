#!/bin/bash

# Check for the -k flag to determine if kcachegrind should be used
flag=""

if [ $# -gt 0 ] && [ "$1" = "-k" ]; then
    flag="k"
fi

# Function to run cg_annotate and optionally kcachegrind
run_cg_annotate() {
    for input_file in callgrind_output/callgrind*; do
        pid=$(echo "$input_file" | sed 's/callgrind_//' |  sed 's/\.out$//')  
        
        # Optionally run kcachegrind if the -k flag is set
        if [ "$flag" = "k" ]; then
            echo "Running kcachegrind for $input_file"
            kcachegrind "$input_file"
        fi
        
        # Annotate the callgrind file and save output
        output_file="callgrind_$pid.txt"
        callgrind_annotate --auto=yes "$input_file" > "$output_file"
        echo "Command executed for $input_file. Output written to $output_file."
    done
}

run_cg_annotate

