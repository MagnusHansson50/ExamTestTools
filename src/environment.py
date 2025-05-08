from playwright.sync_api import sync_playwright

def before_all(context):
    playwright = sync_playwright().start()
    #browser = playwright.chromium.launch(headless=False, slow_mo=1000)  # visa webbläsare
    browser = playwright.chromium.launch(headless=True)
    context.browser = browser.new_page()

def after_all(context):
    context.browser.close()