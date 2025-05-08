from behave import given, when, then

@given('jag har minst en bok som favorit')
def step_have_favorite(context):
    context.page.ensure_at_least_one_favorite()

@when('jag växlar till favoritvy')
def step_switch_to_favorites(context):
    context.page.change_page_to_my_books()

@then('ska endast favoritböcker visas')
def step_only_favorites_visible(context):
    assert context.page.only_favorites_visible()

@given('inga böcker är favoritmarkerade')
def step_clear_favorites(context):
    context.page.clear_all_favorites()

@then('ska ett tomt meddelande visas')
def step_message_about_to_choose_books(context):
    count, message_visible = context.page.empty_favorites_message_is_visible()
    assert count == 0, f"Förväntade 0 favoriter, men fick {count}"
    assert message_visible, "Meddelandet om tom favoritlista visas inte"

@given('jag har alla böcker som favoriter')
def step_all_books_marked_as_favorites(context):
    context.page.mark_all_as_favorites()
