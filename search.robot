*** Settings ***
Documentation   Pesquisar Robot Framework no Google
          ...  Projeto simples de apresentação da ferramenta
          ...  com uma busca simples no Google

Library  SeleniumLibrary

*** Test Cases ***
Cenario: Buscar por Robot Framework no Google e entrar na pagina

    [Tags]  busca
    Pesquisar por "Robot Framework" 
    Verifique se a busca retornou o resultado esperado
    Verifique se a pagina mostrada e a correta

*** Keywords ***
    Open Browser    Chrome      http://www.google.com.br

Digite "${palavra busca}" no campo de busca
    Open Browser    Chrome      http://www.google.com.br

    Set Test Variable  ${palavra busca}
    Input text      id = lst-ib  ${palavra busca}
    Click Button    Pesquisa Google

Verifique se a busca retornou o resultado esperado
    ${titulo} =  Get title
    Should Contain  ${titulo}  ${palavra busca}

Clique no primeiro link
    ${texto} =  Get text  css = #rso > div:nth-child(1) > div > div > div > div > h3
    Click link  ${texto}

Verifique se a pagina mostrada e a correta
    ${titulo}                   Get title
    Should Contain              ${titulo}       ${palavra busca}
    Element text should be      css = h1        ROBOT FRAMEWORK

    Close browser