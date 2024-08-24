#include "test_glob.h"

void Test_GlobMatchSimplePattern(CuTest *tc) {
    Glob glob = {0};
    const char *pattern = "*abc";
    glob_compile(pattern, &glob);

    const char *text = "testabc";
    bool matched = glob_match(text, strlen(text), glob.items, glob.count);

    CuAssertTrue(tc, matched);
}

void Test_GlobMatchQuestionMark(CuTest *tc) {
    Glob glob = {0};
    const char *pattern = "?bc";
    glob_compile(pattern, &glob);

    const char *text = "abc";
    bool matched = glob_match(text, strlen(text), glob.items, glob.count);

    CuAssertTrue(tc, matched);
}

void Test_GlobMatchUnmatched(CuTest *tc) {
    Glob glob = {0};
    const char *pattern = "abc*";
    glob_compile(pattern, &glob);

    const char *text = "def";
    bool matched = glob_match(text, strlen(text), glob.items, glob.count);

    CuAssertTrue(tc, !matched);
}

void Test_GlobCompileUnclosedBlock(CuTest *tc) {
    Glob glob = {0};
    const char *pattern = "[abc";
    Glob_Result result = glob_compile(pattern, &glob);

    CuAssertStrEquals(tc, GLOB_ERROR_UNCLOSED_BLOCK, result.error);
    CuAssertIntEquals(tc, 4, result.location); 
}

CuSuite* TestSuite_glob(void)
{
    CuSuite* suite = CuSuiteNew();
    SUITE_ADD_TEST(suite, Test_GlobMatchQuestionMark);
    SUITE_ADD_TEST(suite, Test_GlobMatchSimplePattern);
    SUITE_ADD_TEST(suite, Test_GlobMatchUnmatched);
    SUITE_ADD_TEST(suite, Test_GlobCompileUnclosedBlock);
    return suite;
}
