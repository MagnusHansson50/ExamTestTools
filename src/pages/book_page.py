from playwright.sync_api import Page

class BooksPage:
    def __init__(self, page: Page):
        self.favorited_titles = []
        self.page = page

    def goto(self):
        self.page.goto("https://tap-ht24-testverktyg.github.io/exam-template/")

    def goto_add_books_page(self):
        self.page.goto("https://tap-ht24-testverktyg.github.io/exam-template/")
        self.page.get_by_test_id("add-book").click()

    def books_list_is_visible(self):
        return self.page.locator(".book").first.is_visible()

    def control_books_list(self, title, author):
        book_text = f'"{title}", {author}'
        # Hitta book container som innehåller denna texten
        book_element = self.page.locator('.book', has_text=book_text)
        return book_element.is_visible()

    def toggle_favorite_marker(self, title):
        book = self.page.get_by_test_id(f"star-{title}")
        book.click()

    def is_favorite(self, title):
        locator = self.page.locator(f'[data-testid="star-{title}"]')
        return "selected" in locator.get_attribute("class")

    def add_new_book(self, title, author):
        self.page.get_by_test_id("add-input-title").fill(title)
        self.page.get_by_test_id("add-input-author").fill(author)

    def is_add_button_enabled(self):
        add_button = self.page.get_by_test_id("add-submit")
        return add_button.is_enabled()
        ##self.page.wait_for_function("document.querySelector('[data-testid=\"add-submit\"]').disabled === false")

    def click_add_button(self):
        add_button = self.page.get_by_test_id("add-submit")
        add_button.click()

    def change_page_to_catalogue(self):
        self.page.get_by_test_id("catalog").click()

    def book_exists_in_catalogue(self, title):
        locator = self.page.locator(f'[data-testid="star-{title}"]')
        return "star" in locator.get_attribute("class")

    def ensure_book_favorited(self, title):
        if not self.is_favorite(title):
            self.toggle_favorite_marker(title)

    def unmark_as_favorite(self, title):
        self.toggle_favorite_marker(title)

    def ensure_at_least_one_favorite(self):
        title = self.page.locator('div.star').first.get_attribute('data-testid')
        title = title.replace('star-', '') if title else None
        self.ensure_book_favorited(title)
        self.favorited_titles.append(title)

    def change_page_to_my_books(self):
        self.page.get_by_test_id("favorites").click()

    def only_favorites_visible(self):
        favorite_list = self.page.locator('ol[data-testid="book-list"]')
        for title in self.favorited_titles:
            expected_id = f"fav-{title}"
            item = favorite_list.locator(f'li[data-testid="{expected_id}"]')
            if not item.is_visible():
                return False
        return True

    def clear_all_favorites(self):
        stars = self.page.locator("div.star.selected")
        count = stars.count()
        for i in range(count):
            stars.nth(i).click()

    def empty_favorites_message_is_visible(self):
        no_favorites = self.page.get_by_text("Dina favoriter:").locator("..").locator("li").count()
        message_visible = self.page.get_by_text("När du valt, kommer dina favoritböcker att visas här.").is_visible()
        return no_favorites, message_visible

    def mark_all_as_favorites(self):
        # Hämta alla böcker som ännu inte är markerade som favorit
        stars = self.page.locator('.star:not(.selected)')
        elements = stars.element_handles()

        for handle in elements:
            try:
                # Extrahera data-testid-attributet
                data_testid = handle.get_attribute("data-testid")
                if not data_testid or not data_testid.startswith("star-"):
                    continue

                # Få ut boktiteln från attributet
                title = data_testid.replace("star-", "")

                # Klicka för att markera som favorit
                handle.click()

                # Vänta tills den markerats som favorit
                self.page.locator(f'[data-testid="star-{title}"].selected').wait_for(timeout=3000)

                # Lägg till i listan över favoritmarkerade titlar
                self.favorited_titles.append(title)
                print(f"Favoritmarkerade: {title}")

            except Exception as e:
                print(f"Kunde inte markera '{data_testid}': {e}")
