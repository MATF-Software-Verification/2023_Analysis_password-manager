#!/bin/bash

set -xe

pm_exec="../../../password-manager-master/pm"
massif_output_dir="massif_outputs"
key_file="../../password-manager-master/key.txt"

if [ ! -d "$massif_output_dir" ]; then
    mkdir "$massif_output_dir"
fi

run_massif_analysis() {
    local argsv=$1
    local args=$2
    local output_file=$3 

    echo "Running Massif with args: $args..."
    valgrind $argsv  --tool=massif --massif-out-file="${massif_output_dir}/${output_file}" $pm_exec $args

    echo "Massif analysis completed for args: $args. Output saved to ${massif_output_dir}/${output_file}"
}

run_massif_analysis ""  "-kf $key_file -gp -c valgrind" "massif_generate_password.out"
run_massif_analysis ""  "-kf $key_file -c mass" "massif_copy_password.out"
run_massif_analysis ""  "-kf $key_file -c '?ass*'" "massif_search.out"
run_massif_analysis ""  "-kf $key_file" "massif_print_all_passwords.out"
run_massif_analysis ""  "-b64enc \"string\" -kf $key_file" "massif_base64_encode.out"
run_massif_analysis ""  "-b64dec \"encoded_string\" -kf $key_file" "massif_base64_decode.out"


run_massif_analysis "--time-unit=B"  "-kf $key_file -gp -c valgrind" "massif_generate_password_better.out"
run_massif_analysis "--time-unit=B"  "-kf $key_file -c mass" "massif_copy_password_better.out"
run_massif_analysis "--time-unit=B" "-kf $key_file -c '?ass*'" "massif_search_better.out"
run_massif_analysis "--time-unit=B"  "-kf $key_file" "massif_print_all_passwords_better.out"
run_massif_analysis "--time-unit=B"  "-b64enc \"string\" -kf $key_file" "massif_base64_encode_better.out"
run_massif_analysis  "--time-unit=B" "-b64dec \"encoded_string\" -kf $key_file" "massif_base64_decode_better.out"

echo "All Massif analyses completed."

