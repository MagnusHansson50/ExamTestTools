from behave import given, when, then

@given('boken "{title}" är favoritmarkerad')
def step_book_is_already_favorite(context, title):
    context.page.ensure_book_favorited(title)

@when('jag avmarkerar boken "{title}"')
def step_unmark_book_as_favorite(context, title):
    context.page.unmark_as_favorite(title)

@then('ska boken "{title}" inte längre vara favorit')
def step_book_not_favorite(context, title):
    assert not context.page.is_favorite(title)