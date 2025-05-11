Feature: Visa endast favoriter
# US5. Se enbart mina böcker
# Som användare vill jag kunna växla vy för att endast se mina böcker.

  Scenario: Användaren filtrerar på favoriter
    Given jag är i vyn Katalog
    And jag har minst en bok som favorit
    When jag växlar till favoritvy
    Then ska endast favoritböcker visas

  Scenario: Favoritvy utan favoriter
    Given jag är i vyn Katalog
    And inga böcker är favoritmarkerade
    When jag växlar till favoritvy
    Then ska ett tomt meddelande visas

  Scenario: Användaren har lagt till alla böcker i favoriter
    Given jag är i vyn Katalog
    And jag har alla böcker som favoriter
    When jag växlar till favoritvy
    Then ska endast favoritböcker visas