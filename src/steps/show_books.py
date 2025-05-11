from behave import given, when, then
from src.pages.book_page import BooksPage

@then('ska en lista med böcker visas')
def step_books_list_visible(context):
    assert context.page.books_list_is_visible()

@then('ska en lista med böcker visas med titel "{title}" och författare "{author}"')
def step_control_books_list(context, title, author):
    assert context.page.control_books_list(title, author), "Boken hittades inte i katalogen"
