Feature: Ta bort en bok från favoriter
# US4. Ta bort en bok från mina böcker
# Som användare vill jag kunna avmarkera en bok som favorit om jag inte längre vill läsa den, så att den inte längre syns bland mina böcker.

  Scenario: Användaren avmarkerar en bok som favorit
    Given jag är i vyn Katalog
    And boken "Jag trodde det var tisdag" är favoritmarkerad
    When jag avmarkerar boken "Jag trodde det var tisdag"
    Then ska boken "Jag trodde det var tisdag" inte längre vara favorit