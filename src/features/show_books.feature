Feature: Visa tillgängliga böcker
# US1. Visa tillgängliga böcker
# Som användare vill jag kunna se en lista med alla tillgängliga böcker så att jag kan välja en att lägga till på mina böcker.


  Scenario: Användaren ser en lista med böcker
    Given jag är i vyn Katalog
    Then ska en lista med böcker visas

  Scenario Outline: Användaren ser en lista med böcker
    Given jag är i vyn Katalog
    Then ska en lista med böcker visas med titel "<title>" och författare "<author>"
      Examples:
      | title                                                       | author             |
      | Hur man tappar bort sin TV-fjärr 10 gånger om dagen         | Bertil Flimmer     |
      | Kaffekokaren som visste för mycket                          | Saga Espresson     |
      | Min katt är min chef                                        | Kattis Jamsson     |
      | 100 sätt att undvika måndagar                               | Göran Snooze       |
      | Gräv där du står – och hitta en pizzameny                   | Maja Skruv         |
      | Jag trodde det var tisdag                                   | Kim Vilsen         |
      | Att prata med växter – och vad de egentligen tycker om dig  | Flora Tistel       |