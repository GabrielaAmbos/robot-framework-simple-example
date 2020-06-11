*** Settings ***
Documentation  Pesquisar Robot Framework no Google
          ...  Projeto simples de apresentação da ferramenta
          ...  com uma busca simples no Google

Library  SeleniumLibrary

*** Test Cases ***
Cenario: Buscar por Robot Framework no Google

    [Tags]  busca
    Abrir o navegador no site "http://www.google.com.br"
    Digitar "Robot Framework" no campo de busca
    Verificar se a busca retornou o resultado esperado

*** Keywords ***
    Open Browser     http://www.google.com.br       Chrome

Abrir o navegador no site "${site}"
    Open Browser     ${site}       Chrome

Digitar "${palavra busca}" no campo de busca
    Set Test Variable            ${palavra busca}
    Input text             q     ${palavra busca}
    Click Element   xpath=//div[@class='FPdoLc tfB0Bf']//*[@name='btnK']

Verificar se a busca retornou o resultado esperado
    ${titulo}           Get title
    Should Contain      ${titulo}  ${palavra busca}

    Close browser