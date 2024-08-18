#!/bin/bash

PM_PATH="../../../password-manager-master/pm"
KEY_FILE="../../password-manager-master/key.txt"
RESULTS_DIR="callgrind_output"


mkdir -p $RESULTS_DIR

run_callgrind() {
    local command=$1
    local description=$2
    local timestamp=$(date +"%Y%m%d%H%M%S")
    
    echo "Running Callgrind for: $description"
    
    local output_file="${RESULTS_DIR}/callgrind_${description}.out"
    
    valgrind --tool=callgrind --cache-sim=yes --branch-sim=yes --callgrind-out-file="$output_file" $command
    
    echo "Output file for $description: $output_file"
}

run_callgrind "$PM_PATH -kf $KEY_FILE -gp -c verifikacija" "generate_and_copy_password"

run_callgrind "$PM_PATH -kf $KEY_FILE -c matf" "copy_saved_password"

run_callgrind "$PM_PATH -kf $KEY_FILE -c '?atf*'" "search_passwords"


run_callgrind "$PM_PATH -kf $KEY_FILE" "print_all_passwords"

run_callgrind "$PM_PATH -b64enc \"string\" -kf $KEY_FILE" "base64_encode_string"


echo "All Callgrind analyses completed and results folder removed."


