*** Settings ***
Documentation        Funcionalidade de cadastro

Library    Browser

*** Keywords ***
Go to signup page
    Click    css=a[href="/deliver"]

    Wait For Elements State    form h1    visible    5000
    Get Text    form h1    equal    Cadastre-se para\nfazer entregas

Fill signup form
    [Arguments]    ${buger_eats}
    Fill Text    css=input[name=fullName]    ${buger_eats}[name]
    Fill Text    css=input[name=cpf]    ${buger_eats}[cpf]
    Fill Text    css=input[name=email]    ${buger_eats}[email]
    Fill Text    css=input[name=whatsapp]    ${buger_eats}[whats]
    Fill Text    css=input[name=postalcode]    ${buger_eats}[cep]

    Click    css=input[type=button][value="Buscar CEP"]

    Get Property    css=input[name=address]    value    equal    ${buger_eats}[rua]
    Get Property    css=input[name=district]    value    equal    ${buger_eats}[bairro]
    Get Property    css=input[name=city-uf]    value    equal    ${buger_eats}[cidade]

    Fill Text    css=input[name=address-number]    ${buger_eats}[numero]
    Fill Text    css=input[name=address-details]    ${buger_eats}[complemento]

    Upload File By Selector        css=input[type=file]    ${EXECDIR}/resources/fixtures/${buger_eats}[cnh]

Delivery method
    [Arguments]    ${delivery_method}
    Click   xpath=//span[text()="${delivery_method}"]/..
    Take Screenshot    selector=//span[text()="${delivery_method}"]/..

Submit signup form
    Click    css=.button-success

Popup should be
    [Arguments]    ${expected_text}
    Wait For Elements State    css=.swal2-html-container    visible    5
    Get Text    css=.swal2-html-container    equal    ${expected_text}

Alert should be
    [Arguments]    ${expected_text}
    Wait For Elements State    css=.alert-error >> text=${expected_text}
    ...    visible    5
