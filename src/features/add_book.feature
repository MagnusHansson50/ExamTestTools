Feature: Lägga till en ny bok

  Scenario: Användaren lägger till en egen bok
    Given jag är i vyn Lägg till en bok
    When jag fyller i titel "Test Driven Development" och författare "Kent Beck"
    And knappen "Lägg till en ny bok" blir aktiv
    And jag klickar på knappen "Lägg till en ny bok"
    Then ska boken "Test Driven Development" finnas i listan i Katalog vyn

  Scenario Outline: Avändaren försöker lägga till en bok utan alla fält ifyllda
    Given jag är i vyn Lägg till en bok
    When jag fyller i titel "<title>" och författare "<author>"
    Then ska knappen "Lägg till en ny bok" vara inaktiv
    Examples:
    |title       | author     |
    | __EMPTY__  | Okänd      |
    | Boktitel   | __EMPTY__  |

  Scenario Outline: Lägga till en ny bok
    Given jag är i vyn Lägg till en bok
    When jag fyller i titel "<title>" och författare "<author>"
    And knappen "Lägg till en ny bok" blir aktiv
    And jag klickar på knappen "Lägg till en ny bok"
    Then ska boken "<title>" finnas i listan i Katalog vyn
    Examples:
      | title                 | author             |
      | Mörkret               | Lars Kepler        |
      | The Hobbit            | J.R.R. Tolkien     |
