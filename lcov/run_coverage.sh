#!/bin/bash

SRC_DIR="../../password-manager-master/source/console"
INCLUDE_DIR="../../password-manager-master/include"
TEST_FILE="tests/test_b64.c"
EXECUTABLE="tests/test_b64"
COV_INFO="my.info"
RESULTS_DIR="results"

gcc $TEST_FILE $SRC_DIR/pm_b64.c -I$INCLUDE_DIR --coverage -o $EXECUTABLE

./$EXECUTABLE

mkdir -p $RESULTS_DIR

lcov -c -d . -o $COV_INFO

genhtml $COV_INFO --output-directory $RESULTS_DIR

xdg-open $RESULTS_DIR/index.html

