*** Settings ***
Documentation        suite de testes de cadastro
Resource    ../resources/base.resource
Library     FakerLibrary    locale=pt_BR
Library    String
Test Setup    Start session
Test Teardown    Finish session

*** Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]    smoke

    ${dog_walker}    Create Dictionary
    ...    name=Gusthavo
    ...    email=teste@teste.com 
    ...    CPF=10020030045
    ...    cep=32604492
    ...    street=Rua Antônio da Silva
    ...    district=Ingá
    ...    city_uf=Betim/MG
    ...    number=1000
    ...    details=apto 100
    ...    cnh=toretto.jpg

    Go to sign up page
    Fill signup form    ${dog_walker}
    Submit signup form
    Popup should be    expected_text=Recebemos o seu cadastro e em breve retornaremos o contato.

Não deve cadastrar com cpf incorreto
    [Tags]    cpf_inv

    ${dog_walker}    Create Dictionary
    ...    name=Gusthavo
    ...    email=teste@teste.com 
    ...    CPF=100200300aa
    ...    cep=32604492
    ...    street=Rua Antônio da Silva
    ...    district=Ingá
    ...    city_uf=Betim/MG
    ...    number=1000
    ...    details=apto 100
    ...    cnh=toretto.jpg

    Go to sign up page
    Fill signup form    ${dog_walker}
    Submit signup form


Não deve cadastrar sem nome
    [Tags]    required

    Go to sign up page
    Submit signup form
    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero  

Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]    aservice

    ${dog_walker}    Create Dictionary
    ...    name=Gusthavo
    ...    email=teste@teste.com 
    ...    CPF=10020030045
    ...    cep=32604492
    ...    street=Rua Antônio da Silva
    ...    district=Ingá
    ...    city_uf=Betim/MG
    ...    number=1000
    ...    details=apto 100
    ...    cnh=toretto.jpg

    Go to sign up page
    Fill signup form    ${dog_walker}
    Additional Service    Adestrar
    Submit signup form
    Popup should be    expected_text=Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo dog walker que sabe adestrar pets
    [Tags]    aservice

    ${dog_walker}    Create Dictionary
    ...    name=Gusthavo
    ...    email=teste@teste.com 
    ...    CPF=10020030045
    ...    cep=32604492
    ...    street=Rua Antônio da Silva
    ...    district=Ingá
    ...    city_uf=Betim/MG
    ...    number=1000
    ...    details=apto 100
    ...    cnh=toretto.jpg

    Go to sign up page
    Fill signup form    ${dog_walker}
    Additional Service    Adestrar
    Submit signup form
    Popup should be    expected_text=Recebemos o seu cadastro e em breve retornaremos o contato.