#include "CuTest.h"
#include <stdio.h>

#include "test_b64.h"
#include "test_rand.h"
#include "test_glob.h"

void RunAllTests(void)
{
    CuString *output = CuStringNew();
    CuSuite *suite = CuSuiteNew();

    CuSuiteAddSuite(suite, TestSuite_b64());
    CuSuiteAddSuite(suite, TestSuite_rand());
    CuSuiteAddSuite(suite, TestSuite_glob());

    CuSuiteRun(suite);

    CuSuiteSummary(suite, output);
    CuSuiteDetails(suite, output);
    printf("%s\n", output->buffer);

    CuSuiteDelete(suite);
    CuStringDelete(output);
}

int main(void)
{
    RunAllTests();
    return 0;
}

