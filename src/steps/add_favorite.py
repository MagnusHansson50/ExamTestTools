from behave import given, when, then

@when('jag markerar boken "{title}" som favorit')
def step_mark_book_as_favorite(context, title):
    context.page.toggle_favorite_marker(title)

@then('ska boken "{title}" vara markerad som favorit')
def step_book_is_favorite(context, title):
    assert context.page.is_favorite(title)

@when('jag klickar två gånger på favoritknappen för "{title}"')
def step_click_favorite_twice(context, title):
    context.page.toggle_favorite_marker(title)
    context.page.toggle_favorite_marker(title)