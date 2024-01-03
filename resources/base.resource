*** Settings ***
Documentation        Arquivo principal do projeto

Library    Browser

Resource    actions/signup.resource

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False
    New Page    https://buger-eats-qa.vercel.app/

    Wait For Elements State    css=h1 >> text=Seja um parceiro entregador pela Buger Eats
    ...    visible    5

Finish Session
    Take Screenshot    fullPage=True