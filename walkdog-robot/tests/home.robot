*** Settings ***
Documentation        suite de testes da home

Library    Browser

*** Test Cases ***
Home page deve estar online
    New Browser     browser=chromium    headless=False
    New Page     https://walkdog.vercel.app/
    #sleep     3
    Get Text    h1    equal    Cuidado e diversão em cada passo
    Take Screenshot