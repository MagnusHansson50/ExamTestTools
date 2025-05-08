from behave import given, when, then
from src.pages.book_page import BooksPage

@given('jag är i vyn Lägg till en bok')
def step_open_add_books_page(context):
    context.page = BooksPage(context.browser)
    context.page.goto_add_books_page()

@when('jag fyller i titel "{title}" och författare "{author}"')
def step_add_new_book(context, title, author):
    title = "" if title == "__EMPTY__" else title
    author = "" if author == "__EMPTY__" else author
    context.page.add_new_book(title, author)

@when('knappen "Lägg till en ny bok" blir aktiv')
def step_wait_for_button_enabled(context):
    assert context.page.is_add_button_enabled()

@when(u'jag klickar på knappen "Lägg till en ny bok"')
def step_click_add_button(context):
    context.page.click_add_button()

@then('ska boken "{title}" finnas i listan i Katalog vyn')
def step_book_exists(context, title):
    context.page.change_page_to_catalogue()
    assert context.page.book_exists_in_catalogue(title)

@then(u'ska knappen "Lägg till en ny bok" vara inaktiv')
def step_impl(context):
    assert not context.page.is_add_button_enabled()