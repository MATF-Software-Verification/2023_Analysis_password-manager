#include "CuTest.h"
#include <stdio.h>

// Uključite zaglavlje testova koje ste napravili
#include "test_b64.h"

// Funkcija koja izvršava sve testove i ispisuje rezultate
void RunAllTests(void)
{
    CuString *output = CuStringNew();
    CuSuite *suite = CuSuiteNew();

    // Dodavanje testove u suit
    CuSuiteAddSuite(suite, TestSuite_b64());

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

