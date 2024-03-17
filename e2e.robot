*** Settings ***
Resource          e2e_resource.robot
Test Setup        Abrir o navegador
Test Teardown     fechar o navegador

*** Test Cases ***
Test E2E Realizando compra de produto com sucesso
    Logar no Sistema
    Ordenar Produtos por Valor
    Adicionar Produtos no Carrinho
    Checar Quantidade de Produtos no Carrinho
    Realizar Checkout
    Validar Produtos no Checkout
    Validar valor total
    Finalizando processo de compra
    
    
