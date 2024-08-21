# 2023_Analysis_password-manager

## Podaci o autoru i projektu koji je predmet analize

**Autor:** Emilija Stevanović, 100/2019

**Projekat:** Password-manager je aplikacija koja se može koristiti kako putem komandne linije (CLI), tako i kroz grafički korisnički interfejs (GUI). Aplikacija nudi različite funkcionalnosti, uključujući čuvanje lozinki, pretraživanje, generisanje novih lozinki, kao i enkripciju i dekripciju stringova.

**Adresa projekta:** [https://github.com/Ciremun/password-manager](https://github.com/Ciremun/password-manager)

Za analizu projekta korišćeni su sledeći alati:

- **Massif**: Alat za analizu potrošnje memorije.
  - Instalacija: `sudo apt-get install valgrind` (na Debian/Ubuntu sistemima)
  - Dokumentacija: [Massif](https://valgrind.org/docs/manual/ms-manual.html)

- **Callgrind**: Alat za analizu vremena izvršenja i profilisanje koda.
  - Instalacija: `sudo apt-get install valgrind` (na Debian/Ubuntu sistemima)
  - Dokumentacija: [Callgrind](https://valgrind.org/docs/manual/cl-manual.html)

- **cppcheck**: Staticki analizator koda za C/C++ projekte.
  - Instalacija: `sudo apt-get install cppcheck` (na Debian/Ubuntu sistemima)
  - Dokumentacija: [cppcheck](http://cppcheck.sourceforge.net/)
  - Folder u projektu: `cppcheck/`
  - Skript za analizu: `cppcheck/run_cppcheck.sh`

- **clang-tidy**: Alat za statičku analizu koda i unapređenje C++ koda.
  - Instalacija: `sudo apt-get install clang-tidy` (na Debian/Ubuntu sistemima)
  - Dokumentacija: [clang-tidy](https://clang.llvm.org/extra/clang-tidy/)

- **CuTest**: Biblioteka za jedinicne testove u C-u.
  - Instalacija: Preuzimanje CuTest.c i CuTest.h fajla.
  - Dokumentacija: [CuTest](https://cutest.sourceforge.net/)

- **lcov**: Alat za analizu pokrivenosti koda.
  - Instalacija: `sudo apt-get install lcov` (na Debian/Ubuntu sistemima)
  - Dokumentacija: [lcov](http://ltp.sourceforge.net/coverage/lcov.php)

Za svaki navedeni alat postoji odgovarajući folder.
Detaljan opis izlaza i pokretanja ovih alata nalazi se u PDF izveštaju koji se nalazi u repozitorijumu.

## Zaključak TODO
