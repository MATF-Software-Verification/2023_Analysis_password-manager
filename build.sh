#!/bin/bash

set -xe

cd password-manager
sh build_console.sh
mv pm-linux-x86_64 pm
echo "secret_key" > key.txt
cd source/ui
make

cd ../..

