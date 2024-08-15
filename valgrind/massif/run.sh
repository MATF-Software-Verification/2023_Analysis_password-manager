#!/bin/bash

set -xe

pm_exec="../../../password-manager-master/pm"
massif_output_dir="massif_outputs"
key_file="../../password-manager-master/key.txt"

# Kreiranje direktorijuma za izlazne fajlove Massif-a ako ne postoji
if [ ! -d "$massif_output_dir" ]; then
    mkdir "$massif_output_dir"
fi

run_massif_analysis() {
    local args=$1
    local output_file=$2

    echo "Running Massif with args: $args..."
    valgrind --tool=massif --massif-out-file="${massif_output_dir}/${output_file}" $pm_exec $args

    echo "Massif analysis completed for args: $args. Output saved to ${massif_output_dir}/${output_file}"
}

# Pokretanje Massif analize sa različitim argumentima
run_massif_analysis "-kf $key_file -gp -c password_name" "massif_generate_password.out"
run_massif_analysis "-kf $key_file -c pass" "massif_copy_password.out"
run_massif_analysis "-kf $key_file" "massif_print_all_passwords.out"
run_massif_analysis "-b64enc \"string\" -kf $key_file" "massif_base64_encode.out"
run_massif_analysis "-b64dec \"encoded_string\" -kf $key_file" "massif_base64_decode.out"

echo "All Massif analyses completed."

