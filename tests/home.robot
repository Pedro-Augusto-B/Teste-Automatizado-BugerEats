*** Settings ***
Documentation        Pagina home da BugerEats

Library        Browser

*** Test Cases ***
A pagina home deve estar online
    New Browser    browser=chromium    headless=False
    New Page    https://buger-eats-qa.vercel.app/

    Get Text    h1    equal    Seja um parceiro entregador pela Buger Eats
