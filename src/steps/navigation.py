from behave import given, when, then
from src.pages.book_page import BooksPage

@when('när sidan laddats')
def step_page_loaded(context):
    context.page.wait_for_page_load()

@then('ska titel \"{title}\" synas')
def step_verify_title(context, title):
    assert context.page.is_title_visible(title), f"Title '{title}' är inte synlig"

@then('en bild \"{alt_text}\" ska synas')
def step_verify_image_alt_text(context, alt_text):
    assert context.page.is_image_visible_with_alt(alt_text), f"Bild med alt '{alt_text}' är inte synlig"

@then('rubrik \"{heading_2}\" med texten \"{text}\" ska synas')
def step_verify_text_displayed(context, heading_2, text):
    assert context.page.is_heading_2_displayed(heading_2), f"Rubrik '{heading_2}' visas inte"
    assert context.page.is_text_displayed(text), f"Text '{text}' visas inte"

@then('ska knapparna "Katalog", "Lägg till bok", och "Mina böcker" synas')
def step_verify_buttons_visible(context):
    assert context.page.is_catalogue_button_visible(), f"'Katalog' knappen är inte synlig"
    assert context.page.is_add_book_button_visible(), f"'Lägg till bok' knappen är inte synlig"
    assert context.page.is_my_books_button_visible(), f"'Mina böcker' knappen är inte synlig"

@then('"Katalog" knappen ska vara ej klickbar')
def step_verify_catalogue_button_disabled(context):
    assert context.page.is_catalogue_button_disabled(), f"Knappen 'Katalog' är inte disabled"

@then('"Lägg till bok" och "Mina böcker" knapparna ska vara klickbara')
def step_verify_add_books_and_my_books_buttons_clickable(context):
    assert context.page.is_add_book_button_clickable(), f"Knappen 'Lägg till bok' är inte klickbar"
    assert context.page.is_my_books_button_clickable(), f"Knappen 'Mina böcker' är inte klickbar"

@then('"Lägg till bok" knappen ska vara ej klickbar')
def step_verify_add_book_button_disabled(context):
    assert context.page.is_add_book_button_disabled(), f"Knappen 'Lägg till bok' är inte disabled"

@then('"Katalog" och "Mina böcker" knapparna ska vara klickbara')
def step_verify_catalogue_and_my_books_buttons_clickable(context):
    assert context.page.is_catalogue_button_clickable(), f"Knappen 'Katalog' är inte klickbar"
    assert context.page.is_my_books_button_clickable(), f"Knappen 'Mina böcker' är inte klickbar"

@given('jag är i vyn Mina böcker')
def step_open_my_books_page(context):
    context.page = BooksPage(context.browser)
    context.page.goto_my_books_page()

@then('"Mina böcker" knappen ska vara ej klickbar')
def step_verify_my_books_button_disabled(context):
    assert context.page.is_my_books_button_disabled(), f"Knappen 'Mina böcker' är inte disabled"

@then('"Lägg till bok" och "Katalog" knapparna ska vara klickbara')
def step_verify_catalogue_and_my_books_buttons_clickable(context):
    assert context.page.is_add_book_button_clickable(), f"Knappen 'Lägg till bok' är inte klickbar"
    assert context.page.is_catalogue_button_clickable(), f"Knappen 'Katalog' är inte klickbar"
