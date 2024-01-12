*** Settings ***
Documentation    arquivo principal do projeto
Library    Browser   
Resource    actions/signup.resource

*** Keywords ***

Start session
    New Browser    browser=chromium    headless=false
    New page    https://walkdog.vercel.app

    Wait For Elements State    css=h1 >> text=Cuidado e diversão em cada passo
    ...    visible    5

Finish session
    Take Screenshot    fullPage=True
