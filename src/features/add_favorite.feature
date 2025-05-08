Feature: Lägga till en bok som favorit

  Scenario: Användaren markerar en bok som favorit
    Given jag är i vyn Katalog
    When jag markerar boken "Kaffekokaren som visste för mycket" som favorit
    Then ska boken "Kaffekokaren som visste för mycket" vara markerad som favorit

  Scenario: Klickar flera gånger på favoritknappen
    Given jag är i vyn Katalog
    When jag klickar två gånger på favoritknappen för "Kaffekokaren som visste för mycket"
    Then ska boken "Kaffekokaren som visste för mycket" inte längre vara favorit

  Scenario Outline: Favoritmarkera en bok
    Given jag är i vyn Katalog
    When jag markerar boken "<title>" som favorit
    Then ska boken "<title>" vara markerad som favorit
    Examples:
      | title                                                       |
      | 100 sätt att undvika måndagar                               |
      | Att prata med växter – och vad de egentligen tycker om dig  |