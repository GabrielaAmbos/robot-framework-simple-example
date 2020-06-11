*** Settings ***
Documentation  Pesquisar Robot Framework no Google
          ...  Projeto simples de apresentação da ferramenta
          ...  com uma busca simples no Google

Library  SeleniumLibrary

*** Test Cases ***
Cenario: Buscar por Robot Framework no Google e entrar na pagina

    [Tags]  busca
    Digite "Robot Framework" no campo de busca
    Verifique se a busca retornou o resultado esperado
    Clique no segundo link
    Verifique se a pagina mostrada e a correta

*** Keywords ***
    Open Browser     http://www.google.com.br       Chrome

Digite "${palavra busca}" no campo de busca
    Open Browser     http://www.google.com.br       Chrome

    Set Test Variable  ${palavra busca}
    Input text      q  ${palavra busca}
    Click Element   xpath=//div[@class='FPdoLc tfB0Bf']//*[@name='btnK']

Verifique se a busca retornou o resultado esperado
    ${titulo} =  Get title
    Should Contain  ${titulo}  ${palavra busca}

Clique no segundo link
    ${texto} =  Get text  css = #rso > div:nth-child(1) > div > div > div > div > h3
    Click link  ${texto}

Verifique se a pagina mostrada e a correta
    ${titulo}                   Get title
    Should Contain              ${titulo}       ${palavra busca}
    Element text should be      css = h1        ROBOT FRAMEWORK

    Close browser