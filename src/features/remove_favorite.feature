Feature: Ta bort en bok från favoriter

  Scenario: Användaren avmarkerar en bok som favorit
    Given jag är i vyn Katalog
    And boken "Jag trodde det var tisdag" är favoritmarkerad
    When jag avmarkerar boken "Jag trodde det var tisdag"
    Then ska boken "Jag trodde det var tisdag" inte längre vara favorit