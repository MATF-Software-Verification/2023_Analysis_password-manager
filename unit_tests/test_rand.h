#ifndef TEST_RAND_H
#define TEST_RAND_H

#include "CuTest.h"
#include "../password-manager/include/console/rand.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

CuSuite* TestSuite_rand(void);
void Test_random_int_in_range(CuTest *tc);
void Test_random_int_no_out_of_range(CuTest *tc);
void Test_random_string_length(CuTest *tc);
void Test_random_string_characters(CuTest *tc);

#endif // TEST_RAND_H
