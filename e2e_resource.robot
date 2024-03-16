***settings***
Library             SeleniumLibrary
Library             String

*** Variables ***
${BROWSER}            Chrome
${BROWSER_OPTIONS}    add_argument("--ignore-certificate-errors")
${URL}                https://www.saucedemo.com/
${NAME}               standard_user
${PASSWORD}           secret_sauce
${CAMPO_NAME}         //input[contains(@placeholder,'Username')]
${CAMPO_PASSWORD}     //input[contains(@placeholder,'Password')]
${BOTÃO_LOGAR}        //input[contains(@id,'login-button')]
${TITLE}              Products


*** Keywords ***
abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

fechar o navegador 
     Capture Page Screenshot

logar no sistema
    Go To    url=${URL} 
    Input Text           locator=${CAMPO_NAME}        text=${NAME}
    Input Password       locator=${CAMPO_PASSWORD}    password=${PASSWORD}
    Click Element        locator=${BOTÃO_LOGAR}
    Wait Until Page Contains    ${TITLE}

Ordenar Produtos por Valor
    Select From List By Label    css:.product_sort_container    Price (low to high)

# Adicionar Produtos no Carrinho
#     FOR  ${index}  IN  RANGE 1  3
#          ${product_name}=    Get Text    (//div[contains(@class,'name ')])[1](${index}) .Sauce Labs Onesie
#         Click Element    xpath://*[@id="produto${index}"]/add-to-cart-sauce-labs-backpack
    
#     END
            





        
        








    
