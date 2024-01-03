*** Settings ***
Documentation       Pagina de cadastro da BugerEats

Resource    ../resources/base.resource

Test Setup    Start Session
Test Teardown    Finish Session

*** Test Cases ***
Deve poder cadastrar um novo entregador
    ${buger_eats}    Create Dictionary
    ...    name=Pedro Augusto
    ...    cpf=00000014141
    ...    email=pedro@gmail.com
    ...    whats=11940028922
    ...    cep=06462030
    ...    rua=Rua Vinícius de Moraes
    ...    bairro=Parque Imperial
    ...    cidade=Barueri/SP
    ...    numero=29
    ...    complemento=Casa 1
    ...    cnh=toma.jpg

    Go to signup page
    Fill signup form    ${buger_eats}
    Submit signup form
    Popup should be    Recebemos os seus dados. Fique de olho na sua caixa de email, pois e em breve retornamos o contato.

Não deve poder cadastrar um novo entregador se os campos obrigatórios não forem preenchidos
    [Tags]    required

    Go to signup page
    Submit signup form

    Alert should be    É necessário informar o nome
    Alert should be    É necessário informar o CPF
    Alert should be    É necessário informar o email
    Alert should be    É necessário informar o CEP
    Alert should be    É necessário informar o número do endereço
    Alert should be    Selecione o método de entrega
    Alert should be    Adicione uma foto da sua CNH

Não deve poder cadastrar um novo entregador se o CPF estiver incorreto
    [Tags]    cpf_inv
    ${buger_eats}    Create Dictionary
    ...    name=Pedro Augusto
    ...    cpf=000000141aa
    ...    email=pedro@gmail.com
    ...    whats=11940028922
    ...    cep=06462030
    ...    rua=Rua Vinícius de Moraes
    ...    bairro=Parque Imperial
    ...    cidade=Barueri/SP
    ...    numero=29
    ...    complemento=Casa 1
    ...    cnh=toma.jpg

    Go to signup page
    Fill signup form    ${buger_eats}
    Submit signup form
    Alert should be    CPF INVÁLIDO

Deve poder cadastrar um novo entregador que selecione o método de entrega como moto
    [Tags]    moto
    ${buger_eats}    Create Dictionary
    ...    name=Pedro Augusto
    ...    cpf=00000014141
    ...    email=pedro@gmail.com
    ...    whats=11940028922
    ...    cep=06462030
    ...    rua=Rua Vinícius de Moraes
    ...    bairro=Parque Imperial
    ...    cidade=Barueri/SP
    ...    numero=29
    ...    complemento=Casa 1
    ...    cnh=toma.jpg

    Go to signup page
    Fill signup form    ${buger_eats}
    Delivery method    Moto
    Submit signup form
    Popup should be    Recebemos os seus dados. Fique de olho na sua caixa de email, pois e em breve retornamos o contato.

Deve poder cadastrar um novo entregador que selecione o método de entrega como Bike Elétrica
    [Tags]    bike
    ${buger_eats}    Create Dictionary
    ...    name=Pedro Augusto
    ...    cpf=00000014141
    ...    email=pedro@gmail.com
    ...    whats=11940028922
    ...    cep=06462030
    ...    rua=Rua Vinícius de Moraes
    ...    bairro=Parque Imperial
    ...    cidade=Barueri/SP
    ...    numero=29
    ...    complemento=Casa 1
    ...    cnh=toma.jpg

    Go to signup page
    Fill signup form    ${buger_eats}
    Delivery method    Bike Elétrica
    Submit signup form
    Popup should be    Recebemos os seus dados. Fique de olho na sua caixa de email, pois e em breve retornamos o contato.

Deve poder cadastrar um novo entregador que selecione o método de entrega como Van/Carro
    [Tags]    van/carro
    ${buger_eats}    Create Dictionary
    ...    name=Pedro Augusto
    ...    cpf=00000014141
    ...    email=pedro@gmail.com
    ...    whats=11940028922
    ...    cep=06462030
    ...    rua=Rua Vinícius de Moraes
    ...    bairro=Parque Imperial
    ...    cidade=Barueri/SP
    ...    numero=29
    ...    complemento=Casa 1
    ...    cnh=toma.jpg

    Go to signup page
    Fill signup form    ${buger_eats}
    Delivery method    Van/Carro
    Submit signup form
    Popup should be    Recebemos os seus dados. Fique de olho na sua caixa de email, pois e em breve retornamos o contato.
