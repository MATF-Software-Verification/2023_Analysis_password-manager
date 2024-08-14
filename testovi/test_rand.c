#include "test_rand.h"

void Test_random_int_in_range(CuTest *tc)
{
    int result = random_int();
    CuAssertTrue(tc, result >= 16 && result <= 32);
}

void Test_random_int_no_out_of_range(CuTest *tc)
{
    int result;
    for (int i = 0; i < 1000; i++) {
        result = random_int();
        CuAssertTrue(tc, result >= 16 && result <= 32);
    }
}

void Test_random_string_length(CuTest *tc)
{
    size_t length = 10;
    uint8_t output[11]; 
    random_string(length, output);
    
    CuAssertIntEquals(tc, length, strlen((char *)output));
}

void Test_random_string_characters(CuTest *tc)
{
    size_t length = 10;
    uint8_t output[11]; 
    random_string(length, output);

    static char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWX"
                            "YZ0123456789!@#$%^&*()-+";
    size_t charset_length = sizeof(charset) - 1;

    for (size_t i = 0; i < length; i++) {
        CuAssertTrue(tc, strchr(charset, output[i]) != NULL);
    }
}

CuSuite* TestSuite_rand(void)
{
    CuSuite* suite = CuSuiteNew();
    SUITE_ADD_TEST(suite, Test_random_int_in_range);
    SUITE_ADD_TEST(suite, Test_random_int_no_out_of_range);
    SUITE_ADD_TEST(suite, Test_random_string_length);
    SUITE_ADD_TEST(suite, Test_random_string_characters);
    return suite;
}
