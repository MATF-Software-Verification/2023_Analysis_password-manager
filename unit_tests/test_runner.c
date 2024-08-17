#include "CuTest.h"
#include <stdio.h>

#include "test_b64.h"
#include "test_rand.h"

// Funkcija koja izvršava sve testove i ispisuje rezultate
void RunAllTests(void)
{
    CuString *output = CuStringNew();
    CuSuite *suite = CuSuiteNew();

    // Dodavanje testove u suit
    CuSuiteAddSuite(suite, TestSuite_b64());
    CuSuiteAddSuite(suite, TestSuite_rand());

    // Pokretanje testova
    CuSuiteRun(suite);

    // Ispis rezultata
    CuSuiteSummary(suite, output);
    CuSuiteDetails(suite, output);
    printf("%s\n", output->buffer);

    // Memorija
    CuSuiteDelete(suite);
    CuStringDelete(output);
}

int main(void)
{
    RunAllTests();
    return 0;
}

