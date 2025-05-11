from behave import given, when, then
from src.pages.book_page import BooksPage

@given('jag är i vyn Katalog')
def step_open_books_page(context):
    context.page = BooksPage(context.browser)
    context.page.goto()

@when('jag klickar två gånger på favoritknappen för "{title}"')
def step_click_favorite_twice(context, title):
    context.page.toggle_favorite_marker(title)
    context.page.toggle_favorite_marker(title)

@then('ska boken "{title}" inte längre vara favorit')
def step_book_not_favorite(context, title):
    assert not context.page.is_favorite(title)