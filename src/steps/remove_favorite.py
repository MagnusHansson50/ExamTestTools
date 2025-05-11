from behave import given, when, then

@given('boken "{title}" är favoritmarkerad')
def step_book_is_already_favorite(context, title):
    context.page.ensure_book_favorited(title)

@when('jag avmarkerar boken "{title}"')
def step_unmark_book_as_favorite(context, title):
    context.page.unmark_as_favorite(title)