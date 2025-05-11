Feature: Navigation och layoutverifiering
  För att säkerställa korrekt navigering och struktur
  Som användare av Läslistan-appen
  Jag vill se rätt layout, menyalternativ och initial vy

# US6.1 Visa applikationens startsida
# Som användare vill jag kunna navigera till applikationen och se titeln "Läslistan" så att jag vet att jag har kommit till rätt sida.
# US6.2 Visa startsidans innehåll
# Som användare vill jag kunna se en hero-bild med alt-texten "Bokklubb på café" så att jag känner igen applikationen visuellt.
# US6.3 Visa välkomstmeddelande
# Som användare vill jag se välkomstmeddelandet "Välkommen! Sidan för dig som gillar att läsa. Välj dina favoriter." så att jag får en introduktion till applikationens syfte.
  Scenario: Verifiera struktur och layout "Katalog" vy
    Given jag är i vyn Katalog
    When när sidan laddats
    Then ska titel "Läslistan" synas
    And en bild "Bokklubb på café" ska synas
    And rubrik "Välkommen!" med texten "Sidan för dig som gillar att läsa. Välj dina favoriter." ska synas

# US6.4 Navigeringsmeny - Knappar synliga
# Som användare vill jag kunna se knapparna "Katalog", "Lägg till bok", och "Mina böcker" så att jag kan navigera i applikationen.
# US6.5 Knapparnas tillstånd - Katalog
# Som användare vill jag att knappen "Katalog" ska vara inaktiverad när jag redan befinner mig i katalogvyn för att undvika förvirring, medan "Lägg till bok" och "Mina böcker" är aktiva.
  Scenario: Verifiera navigations menu och dess status "Katalog" vy
    Given jag är i vyn Katalog
    When när sidan laddats
    Then ska knapparna "Katalog", "Lägg till bok", och "Mina böcker" synas
    And "Katalog" knappen ska vara ej klickbar
    And "Lägg till bok" och "Mina böcker" knapparna ska vara klickbara

# US6.1 Visa applikationens startsida
# Som användare vill jag kunna navigera till applikationen och se titeln "Läslistan" så att jag vet att jag har kommit till rätt sida.
# US6.2 Visa startsidans innehåll
# Som användare vill jag kunna se en hero-bild med alt-texten "Bokklubb på café" så att jag känner igen applikationen visuellt.
# US6.3 Visa välkomstmeddelande
# Som användare vill jag se välkomstmeddelandet "Välkommen! Sidan för dig som gillar att läsa. Välj dina favoriter." så att jag får en introduktion till applikationens syfte.
  Scenario: Verifiera struktur och layout "Lägg till bok" vy
    Given jag är i vyn Lägg till en bok
    When när sidan laddats
    Then ska titel "Läslistan" synas
    And en bild "Bokklubb på café" ska synas
    And rubrik "Välkommen!" med texten "Sidan för dig som gillar att läsa. Välj dina favoriter." ska synas

# US6.4 Navigeringsmeny - Knappar synliga
# Som användare vill jag kunna se knapparna "Katalog", "Lägg till bok", och "Mina böcker" så att jag kan navigera i applikationen.
# US6.6 Knapparnas tillstånd - Lägg till bok
# Som användare vill jag att knappen "Lägg till bok" ska vara inaktiverad när jag redan befinner mig i "Lägg till bok" vyn för att undvika förvirring, medan "Katalog" och "Mina böcker" är aktiva.
  Scenario: Verifiera navigations menu och dess status "Lägg till bok" vy
    Given jag är i vyn Lägg till en bok
    When när sidan laddats
    Then ska knapparna "Katalog", "Lägg till bok", och "Mina böcker" synas
    And "Lägg till bok" knappen ska vara ej klickbar
    And "Katalog" och "Mina böcker" knapparna ska vara klickbara

# US6.1 Visa applikationens startsida
# Som användare vill jag kunna navigera till applikationen och se titeln "Läslistan" så att jag vet att jag har kommit till rätt sida.
# US6.2 Visa startsidans innehåll
# Som användare vill jag kunna se en hero-bild med alt-texten "Bokklubb på café" så att jag känner igen applikationen visuellt.
# US6.3 Visa välkomstmeddelande
# Som användare vill jag se välkomstmeddelandet "Välkommen! Sidan för dig som gillar att läsa. Välj dina favoriter." så att jag får en introduktion till applikationens syfte.
  Scenario: Verifiera struktur och layout "Mina böcker" vy
    Given jag är i vyn Mina böcker
    When när sidan laddats
    Then ska titel "Läslistan" synas
    And en bild "Bokklubb på café" ska synas
    And rubrik "Välkommen!" med texten "Sidan för dig som gillar att läsa. Välj dina favoriter." ska synas

# US6.4 Navigeringsmeny - Knappar synliga
# Som användare vill jag kunna se knapparna "Katalog", "Lägg till bok", och "Mina böcker" så att jag kan navigera i applikationen.
# US6.7 Knapparnas tillstånd - Mina böcker
# Som användare vill jag att knappen "Mina böcker" ska vara inaktiverad när jag redan befinner mig i "Mina böcker" vyn för att undvika förvirring, medan "Lägg till bok" och "Katalog" är aktiva.
  Scenario: Verifiera navigations menu och dess status "Mina böcker" vy
    Given jag är i vyn Mina böcker
    When när sidan laddats
    Then ska knapparna "Katalog", "Lägg till bok", och "Mina böcker" synas
    And "Mina böcker" knappen ska vara ej klickbar
    And "Lägg till bok" och "Katalog" knapparna ska vara klickbara