#ifndef TEST_B64_H
#define TEST_B64_H

#include "CuTest.h"
#include "../password-manager-master/include/console/b64.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

CuSuite* TestSuite_b64(void);
void Test_b64_decode(CuTest *tc);
void Test_b64_encode(CuTest *tc);

#endif // TEST_B64_H


