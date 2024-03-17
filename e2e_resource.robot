***settings***
Library             SeleniumLibrary
Library             String

*** Variables ***
${BROWSER}                Chrome
${BROWSER_OPTIONS}        add_argument("--ignore-certificate-errors")
${URL}                    https://www.saucedemo.com/
${NAME}                   standard_user
${PASSWORD}               secret_sauce
${CAMPO_NAME}             //input[contains(@placeholder,'Username')]
${CAMPO_PASSWORD}         //input[contains(@placeholder,'Password')]
${BOTÃO_LOGAR}            //input[contains(@id,'login-button')]
${TITLE}                  Products
${BOTAO_ADD}                //button[contains(@data-test,'add-to-cart-sauce-labs-backpack')]




*** Keywords ***
abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
fechar o navegador 
     Capture Page Screenshot
logar no sistema
    Go To    url=${URL} 
    Input Text           locator=${CAMPO_NAME}        text=${NAME}
    Sleep    500ms 
    Input Password       locator=${CAMPO_PASSWORD}    password=${PASSWORD}
    Sleep    500ms 
    Click Element        locator=${BOTÃO_LOGAR}
    Sleep    500ms 
    Wait Until Page Contains    ${TITLE}
    Sleep    500ms 

Ordenar Produtos por Valor
    Select From List By Label    css:.product_sort_container    Price (low to high)

Adicionar Produtos no Carrinho
    FOR    ${index}    IN RANGE    1    4
         ${product_name}=    Get Text    xpath=(//div[contains(@class,'name ')])[${index}]
        Click Element    xpath=(//div[contains(@class,'inventory_item_name')])[${index}]//following::button[contains(@data-test,'add-to-cart')]
        Sleep    500ms   # Pausa de 500 milissegundos entre as iterações
    END
Checar Quantidade de Produtos no Carrinho
    Click Element    css=.shopping_cart_link
    Element Should Contain    css=.cart_list > :nth-child(3)    Sauce Labs Onesie
    Sleep    300ms 
    Element Should Contain    css=.cart_list > :nth-child(4)    Sauce Labs Bike Light
    Sleep    300ms 
    Element Should Contain    css=.cart_list > :nth-child(5)    Sauce Labs Bolt T-Shirt
    Sleep    300ms 
    Element Text Should Be    css=.shopping_cart_badge    3
    Sleep    300ms 

Realizar Checkout
    Click Element    css=[data-test="checkout"]
    Input Text    css=[data-test="firstName"]    Teste first Name
    Input Text    css=[data-test="lastName"]    Teste last Name
    Input Text    css=[data-test="postalCode"]    73357552
    Click Element    css=[data-test="continue"]
    Sleep    500ms 

Validar Produtos no Checkout
    Element Should Contain    css=.cart_list > :nth-child(3)    Sauce Labs Onesie
    Element Should Contain    css=.cart_list > :nth-child(4)    Sauce Labs Bike Light
    Element Should Contain    css=.cart_list > :nth-child(5)    Sauce Labs Bolt T-Shirt
    Sleep    500ms 
Validar valor total
    Element Text Should Be    css=.summary_total_label    Total: $36.69
    Sleep    500ms 
 Finalizando processo de compra
      Click Element    //button[@id='finish']
      Wait Until Page Contains    text=Thank you for your order!