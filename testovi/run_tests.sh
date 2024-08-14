#!/bin/sh

set -xe

# Kompajliranje testova
gcc -o test_runner test_runner.c test_b64.c test_rand.c ../password-manager-master/source/console/pm_b64.c  ../password-manager-master/source/console/pm_rand.c  CuTest.c -I../password-manager-master/include -I../password-manager-master/include/console


# Pokretanje testova
./test_runner

