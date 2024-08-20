#!/bin/bash

set -xe

cd password-manager-master
sh build_console.sh
mv pm-linux-x86_64 pm
cd source/ui
make

cd ../..

