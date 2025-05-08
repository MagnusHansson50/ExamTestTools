# Läslistan - Automatiserade tester

Detta projekt innehåller automatiserade tester för webbsidan [Läslistan](https://tap-ht24-testverktyg.github.io/exam-template/), skapade med Python, pytest, Playwright och behave.

## Prerequisites

- pip install pytest-playwright
- playwright install
- cd srcpip install behave

## Vad har testats

- Visning av boklistan (med och utan innehåll)
- Favoritmarkering och avmarkering av böcker
- Lägga till nya böcker (både lyckade och misslyckade försök)
- Filtrering för att endast visa favoriter
- Gränsfall som klicka på favoritikonen flera gånger

## Hur man startar projektet
- cd src/
- python -m behave
