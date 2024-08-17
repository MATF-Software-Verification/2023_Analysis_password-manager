#!/bin/sh

COV_INFO="my.info"
RESULTS_DIR="results"

set -xe

gcc -o test_runner test_runner.c test_b64.c test_rand.c ../password-manager-master/source/console/pm_b64.c  ../password-manager-master/source/console/pm_rand.c  CuTest.c -I../password-manager-master/include -I../password-manager-master/include/console --coverage -o test_runner


./test_runner

mkdir -p $RESULTS_DIR

lcov -c -d . -o $COV_INFO

genhtml $COV_INFO --output-directory $RESULTS_DIR

xdg-open $RESULTS_DIR/index.html

