*** Settings ***
Documentation    ações, steps e elementos da funcionalidade  de cadastro
Library    Browser

*** Keywords ***
Go to sign up page
    #New Browser    browser=chromium    headless=false
    Click    css=a[href="/signup"]
    Wait For Elements State    form h1    visible    500
    Get Text    form h1    equal    Faça seu cadastro

Fill signup form
    [Arguments]    ${dog_walker}
    Fill Text    css=input[placeholder^=Nome]    ${dog_walker}[name]
    Fill Text    css=input[name=email]    ${dog_walker}[email]
    Fill Text    css=input[name=cpf]    ${dog_walker}[CPF]
    Fill Text    css=input[name=cep]    ${dog_walker}[cep]
    Click        css=input[value="Buscar CEP"]
    Get Property   css=input[name=addressStreet]    value    equal    ${dog_walker}[street]
    Get Property   css=input[name=addressDistrict]    value    equal    ${dog_walker}[district]
    Get Property   css=input[name=addressCityUf]    value    equal    ${dog_walker}[city_uf]
    Fill Text    css=input[name=addressNumber]    ${dog_walker}[number]
    Fill Text    css=input[name=addressDetails]    ${dog_walker}[details]
    Click    xpath=//span[text()="${dog_walker}[aditional_service]"]/..
    Upload File By Selector    input[type=file]    ${execdir}/resources/fixtures/${dog_walker}[cnh] 

Additional Service
    [Arguments]    ${aditional_service}
    Click    xpath=//span[text()="${aditional_service}"]/.. 

Submit signup form
    Click        css=.button-register

Popup should be
    [Arguments]    ${expected_text}
    Wait For Elements State    css=.swal2-html-container    visible    10
    Get Text    css=.swal2-html-container    equal    ${expected_text}

Alert should be
    [Arguments]        ${expected_text}
    Wait For Elements State    css=.alert-error >> text=${expected_text}   visible    5
    

