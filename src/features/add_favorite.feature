Feature: Lägga till en bok som favorit
  # US2. Lägga till en bok till mina böcker
  # Som användare vill jag kunna markera en bok som favorit så att jag kan spara böcker jag vill läsa i mina böcker.

  Scenario: Användaren markerar en bok som favorit
    Given jag är i vyn Katalog
    When jag markerar boken "Kaffekokaren som visste för mycket" som favorit
    Then ska boken "Kaffekokaren som visste för mycket" vara markerad som favorit

  Scenario: Klickar två gånger på favoritknappen
    Given jag är i vyn Katalog
    When jag klickar två gånger på favoritknappen för "Kaffekokaren som visste för mycket"
    Then ska boken "Kaffekokaren som visste för mycket" inte längre vara favorit

  Scenario: Klickar tre gånger på favoritknappen
    Given jag är i vyn Katalog
    When jag klickar tre gånger på favoritknappen för "Kaffekokaren som visste för mycket"
    Then ska boken "Kaffekokaren som visste för mycket" vara markerad som favorit

  Scenario Outline: Favoritmarkera en bok
    Given jag är i vyn Katalog
    When jag markerar boken "<title>" som favorit
    Then ska boken "<title>" vara markerad som favorit
    Examples:
      | title                                                       |
      | 100 sätt att undvika måndagar                               |
      | Att prata med växter – och vad de egentligen tycker om dig  |