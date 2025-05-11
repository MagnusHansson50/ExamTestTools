# Läslistan - Automatiserade tester

Detta projekt innehåller automatiserade tester för webbsidan [Läslistan](https://tap-ht24-testverktyg.github.io/exam-template/), skapade med Python, pytest, Playwright och behave.

## Prerequisites

- pip install pytest-playwright
- playwright install
- cd src
- pip install behave

## Vad har testats

- Visning av boklistan (med och utan innehåll).
- Favoritmarkering och avmarkering av böcker.
- Lägga till nya böcker (både lyckade och misslyckade försök).
- Filtrering för att endast visa favoriter.
- Gränsfall som klicka på favoritikonen flera gånger.
- Sidans innehåll och navigeringsmeny.
- Sidans texter(antagligen lite överflödigt då det blir mycket att underhålla när texter ändras)
- Lägga till samma bok två gånger. Det testet togs bort då det ställer till det lite, eftersom det kommer vara två böcker med samma test id. Dvs en liten bugg kanske.
- Lite dubbel testning förekommer för att visa scenario outlines.

## Hur man startar projektet
- cd \PycharmProjects\ExamTestTools 
- python -m behave ./src/

## Vad han jag inte med
- Kunde optimerat ytterliggare lite 
- Kunde använt fler pages filer

## Testkörning
(.venv) PS C:\Users\MagnusHansson\PycharmProjects\ExamTestTools> python -m behave ./src/
Feature: Lägga till en ny bok # src/features/add_book.feature:1

  Scenario: Användaren lägger till en egen bok                                   # src/features/add_book.feature:5
    Given jag är i vyn Lägg till en bok                                          # src/steps/add_book.py:4
    When jag fyller i titel "Test Driven Development" och författare "Kent Beck" # src/steps/add_book.py:9
    And knappen "Lägg till en ny bok" blir aktiv                                 # src/steps/add_book.py:15
    And jag klickar på knappen "Lägg till en ny bok"                             # src/steps/add_book.py:19
    Then ska boken "Test Driven Development" finnas i listan i Katalog vyn       # src/steps/add_book.py:23

  Scenario Outline: Avändaren försöker lägga till en bok utan alla fält ifyllda -- @1.1   # src/features/add_book.feature:18
    Given jag är i vyn Lägg till en bok                                                   # src/steps/add_book.py:4
    When jag fyller i titel "__EMPTY__" och författare "Okänd"                            # src/steps/add_book.py:9
    Then ska knappen "Lägg till en ny bok" vara inaktiv                                   # src/steps/add_book.py:28

  Scenario Outline: Avändaren försöker lägga till en bok utan alla fält ifyllda -- @1.2   # src/features/add_book.feature:19
    Given jag är i vyn Lägg till en bok                                                   # src/steps/add_book.py:4
    When jag fyller i titel "Boktitel" och författare "__EMPTY__"                         # src/steps/add_book.py:9
    Then ska knappen "Lägg till en ny bok" vara inaktiv                                   # src/steps/add_book.py:28

  Scenario Outline: Lägga till en ny bok -- @1.1                   # src/features/add_book.feature:29
    Given jag är i vyn Lägg till en bok                            # src/steps/add_book.py:4
    When jag fyller i titel "Mörkret" och författare "Lars Kepler" # src/steps/add_book.py:9
    And knappen "Lägg till en ny bok" blir aktiv                   # src/steps/add_book.py:15
    And jag klickar på knappen "Lägg till en ny bok"               # src/steps/add_book.py:19
    Then ska boken "Mörkret" finnas i listan i Katalog vyn         # src/steps/add_book.py:23

  Scenario Outline: Lägga till en ny bok -- @1.2                         # src/features/add_book.feature:30
    Given jag är i vyn Lägg till en bok                                  # src/steps/add_book.py:4
    When jag fyller i titel "The Hobbit" och författare "J.R.R. Tolkien" # src/steps/add_book.py:9
    And knappen "Lägg till en ny bok" blir aktiv                         # src/steps/add_book.py:15
    And jag klickar på knappen "Lägg till en ny bok"                     # src/steps/add_book.py:19
    Then ska boken "The Hobbit" finnas i listan i Katalog vyn            # src/steps/add_book.py:23

Feature: Lägga till en bok som favorit # src/features/add_favorite.feature:1

  Scenario: Användaren markerar en bok som favorit                                # src/features/add_favorite.feature:5
    Given jag är i vyn Katalog                                                    # src/steps/common_steps.py:4
    When jag markerar boken "Kaffekokaren som visste för mycket" som favorit      # src/steps/add_favorite.py:3
    Then ska boken "Kaffekokaren som visste för mycket" vara markerad som favorit # src/steps/add_favorite.py:7

  Scenario: Klickar två gånger på favoritknappen                                           # src/features/add_favorite.feature:10
    Given jag är i vyn Katalog                                                             # src/steps/common_steps.py:4
    When jag klickar två gånger på favoritknappen för "Kaffekokaren som visste för mycket" # src/steps/common_steps.py:9
    Then ska boken "Kaffekokaren som visste för mycket" inte längre vara favorit           # src/steps/common_steps.py:14

  Scenario: Klickar tre gånger på favoritknappen                                           # src/features/add_favorite.feature:15
    Given jag är i vyn Katalog                                                             # src/steps/common_steps.py:4
    When jag klickar tre gånger på favoritknappen för "Kaffekokaren som visste för mycket" # src/steps/add_favorite.py:11
    Then ska boken "Kaffekokaren som visste för mycket" vara markerad som favorit          # src/steps/add_favorite.py:7

  Scenario Outline: Favoritmarkera en bok -- @1.1                            # src/features/add_favorite.feature:26
    Given jag är i vyn Katalog                                               # src/steps/common_steps.py:4
    When jag markerar boken "100 sätt att undvika måndagar" som favorit      # src/steps/add_favorite.py:3
    Then ska boken "100 sätt att undvika måndagar" vara markerad som favorit # src/steps/add_favorite.py:7

  Scenario Outline: Favoritmarkera en bok -- @1.2                                                         # src/features/add_favorite.feature:27
    Given jag är i vyn Katalog                                                                            # src/steps/common_steps.py:4
    When jag markerar boken "Att prata med växter – och vad de egentligen tycker om dig" som favorit      # src/steps/add_favorite.py:3
    Then ska boken "Att prata med växter – och vad de egentligen tycker om dig" vara markerad som favorit # src/steps/add_favorite.py:7

Feature: Visa endast favoriter # src/features/filter.favorites.feature:1

  Scenario: Användaren filtrerar på favoriter  # src/features/filter.favorites.feature:5
    Given jag är i vyn Katalog                 # src/steps/common_steps.py:4
    And jag har minst en bok som favorit       # src/steps/filter_favorites.py:3
    When jag växlar till favoritvy             # src/steps/filter_favorites.py:7
    Then ska endast favoritböcker visas        # src/steps/filter_favorites.py:11

  Scenario: Favoritvy utan favoriter    # src/features/filter.favorites.feature:11
    Given jag är i vyn Katalog          # src/steps/common_steps.py:4
    And inga böcker är favoritmarkerade # src/steps/filter_favorites.py:15
    When jag växlar till favoritvy      # src/steps/filter_favorites.py:7
    Then ska ett tomt meddelande visas  # src/steps/filter_favorites.py:19

  Scenario: Användaren har lagt till alla böcker i favoriter  # src/features/filter.favorites.feature:17
    Given jag är i vyn Katalog                                # src/steps/common_steps.py:4
    And jag har alla böcker som favoriter                     # src/steps/filter_favorites.py:25
    When jag växlar till favoritvy                            # src/steps/filter_favorites.py:7
    Then ska endast favoritböcker visas                       # src/steps/filter_favorites.py:11

Feature: Navigation och layoutverifiering # src/features/navigation.feature:1
  För att säkerställa korrekt navigering och struktur
  Som användare av Läslistan-appen
  Jag vill se rätt layout, menyalternativ och initial vy
  Scenario: Verifiera struktur och layout "Katalog" vy                                                     # src/features/navigation.feature:12
    Given jag är i vyn Katalog                                                                             # src/steps/common_steps.py:4
    When när sidan laddats                                                                                 # src/steps/navigation.py:4
    Then ska titel "Läslistan" synas                                                                       # src/steps/navigation.py:8
    And en bild "Bokklubb på café" ska synas                                                               # src/steps/navigation.py:12
    And rubrik "Välkommen!" med texten "Sidan för dig som gillar att läsa. Välj dina favoriter." ska synas # src/steps/navigation.py:16

  Scenario: Verifiera navigations menu och dess status "Katalog" vy        # src/features/navigation.feature:23
    Given jag är i vyn Katalog                                             # src/steps/common_steps.py:4
    When när sidan laddats                                                 # src/steps/navigation.py:4
    Then ska knapparna "Katalog", "Lägg till bok", och "Mina böcker" synas # src/steps/navigation.py:21
    And "Katalog" knappen ska vara ej klickbar                             # src/steps/navigation.py:27
    And "Lägg till bok" och "Mina böcker" knapparna ska vara klickbara     # src/steps/navigation.py:31

  Scenario: Verifiera struktur och layout "Lägg till bok" vy                                               # src/features/navigation.feature:36
    Given jag är i vyn Lägg till en bok                                                                    # src/steps/add_book.py:4
    When när sidan laddats                                                                                 # src/steps/navigation.py:4
    Then ska titel "Läslistan" synas                                                                       # src/steps/navigation.py:8
    And en bild "Bokklubb på café" ska synas                                                               # src/steps/navigation.py:12
    And rubrik "Välkommen!" med texten "Sidan för dig som gillar att läsa. Välj dina favoriter." ska synas # src/steps/navigation.py:16

  Scenario: Verifiera navigations menu och dess status "Lägg till bok" vy  # src/features/navigation.feature:47
    Given jag är i vyn Lägg till en bok                                    # src/steps/add_book.py:4
    When när sidan laddats                                                 # src/steps/navigation.py:4
    Then ska knapparna "Katalog", "Lägg till bok", och "Mina böcker" synas # src/steps/navigation.py:21
    And "Lägg till bok" knappen ska vara ej klickbar                       # src/steps/navigation.py:36
    And "Katalog" och "Mina böcker" knapparna ska vara klickbara           # src/steps/navigation.py:40

  Scenario: Verifiera struktur och layout "Mina böcker" vy                                                 # src/features/navigation.feature:60
    Given jag är i vyn Mina böcker                                                                         # src/steps/navigation.py:45
    When när sidan laddats                                                                                 # src/steps/navigation.py:4
    Then ska titel "Läslistan" synas                                                                       # src/steps/navigation.py:8
    And en bild "Bokklubb på café" ska synas                                                               # src/steps/navigation.py:12
    And rubrik "Välkommen!" med texten "Sidan för dig som gillar att läsa. Välj dina favoriter." ska synas # src/steps/navigation.py:16

  Scenario: Verifiera navigations menu och dess status "Mina böcker" vy    # src/features/navigation.feature:71
    Given jag är i vyn Mina böcker                                         # src/steps/navigation.py:45
    When när sidan laddats                                                 # src/steps/navigation.py:4
    Then ska knapparna "Katalog", "Lägg till bok", och "Mina böcker" synas # src/steps/navigation.py:21
    And "Mina böcker" knappen ska vara ej klickbar                         # src/steps/navigation.py:50
    And "Lägg till bok" och "Katalog" knapparna ska vara klickbara         # src/steps/navigation.py:54

Feature: Ta bort en bok från favoriter # src/features/remove_favorite.feature:1

  Scenario: Användaren avmarkerar en bok som favorit                    # src/features/remove_favorite.feature:5
    Given jag är i vyn Katalog                                          # src/steps/common_steps.py:4
    And boken "Jag trodde det var tisdag" är favoritmarkerad            # src/steps/remove_favorite.py:3
    When jag avmarkerar boken "Jag trodde det var tisdag"               # src/steps/remove_favorite.py:7
    Then ska boken "Jag trodde det var tisdag" inte längre vara favorit # src/steps/common_steps.py:14

Feature: Visa tillgängliga böcker # src/features/show_books.feature:1

  Scenario: Användaren ser en lista med böcker  # src/features/show_books.feature:6
    Given jag är i vyn Katalog                  # src/steps/common_steps.py:4
    Then ska en lista med böcker visas          # src/steps/show_books.py:4

  Scenario Outline: Användaren ser en lista med böcker -- @1.1                                                                         # src/features/show_books.feature:15
    Given jag är i vyn Katalog                                                                                                         # src/steps/common_steps.py:4
    Then ska en lista med böcker visas med titel "Hur man tappar bort sin TV-fjärr 10 gånger om dagen" och författare "Bertil Flimmer" # src/steps/show_books.py:8

  Scenario Outline: Användaren ser en lista med böcker -- @1.2                                                        # src/features/show_books.feature:16
    Given jag är i vyn Katalog                                                                                        # src/steps/common_steps.py:4
    Then ska en lista med böcker visas med titel "Kaffekokaren som visste för mycket" och författare "Saga Espresson" # src/steps/show_books.py:8

  Scenario Outline: Användaren ser en lista med böcker -- @1.3                                          # src/features/show_books.feature:17
    Given jag är i vyn Katalog                                                                          # src/steps/common_steps.py:4
    Then ska en lista med böcker visas med titel "Min katt är min chef" och författare "Kattis Jamsson" # src/steps/show_books.py:8

  Scenario Outline: Användaren ser en lista med böcker -- @1.4                                                 # src/features/show_books.feature:18
    Given jag är i vyn Katalog                                                                                 # src/steps/common_steps.py:4
    Then ska en lista med böcker visas med titel "100 sätt att undvika måndagar" och författare "Göran Snooze" # src/steps/show_books.py:8

  Scenario Outline: Användaren ser en lista med böcker -- @1.5                                                           # src/features/show_books.feature:19
    Given jag är i vyn Katalog                                                                                           # src/steps/common_steps.py:4
    Then ska en lista med böcker visas med titel "Gräv där du står – och hitta en pizzameny" och författare "Maja Skruv" # src/steps/show_books.py:8

  Scenario Outline: Användaren ser en lista med böcker -- @1.6                                           # src/features/show_books.feature:20
    Given jag är i vyn Katalog                                                                           # src/steps/common_steps.py:4
    Then ska en lista med böcker visas med titel "Jag trodde det var tisdag" och författare "Kim Vilsen" # src/steps/show_books.py:8

  Scenario Outline: Användaren ser en lista med böcker -- @1.7                                                                              # src/features/show_books.feature:21
    Given jag är i vyn Katalog                                                                                                              # src/steps/common_steps.py:4
    Then ska en lista med böcker visas med titel "Att prata med växter – och vad de egentligen tycker om dig" och författare "Flora Tistel" # src/steps/show_books.py:8

6 features passed, 0 failed, 0 skipped
28 scenarios passed, 0 failed, 0 skipped
98 steps passed, 0 failed, 0 skipped, 0 undefined
Took 0m6.139s
(.venv) PS C:\Users\MagnusHansson\PycharmProjects\ExamTestTools> 
