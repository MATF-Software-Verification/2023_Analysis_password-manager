#ifndef TEST_GLOB_H
#define TEST_GLOB_H

#include "CuTest.h"
#include "../password-manager/include/console/glob.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

CuSuite* TestSuite_glob(void);
void Test_GlobMatchSimplePattern(CuTest *tc);
void Test_GlobMatchQuestionMark(CuTest *tc);
void Test_GlobMatchUnmatched(CuTest *tc);
void Test_GlobCompileUnclosedBlock(CuTest *tc);
#endif // TEST_GLOB_H
