*** Settings ***
Resource    ../../resource/login.robot

*** Test Cases ***
Login do Administrador
    [Documentation]    Realiza login e valida que o token foi obtido com sucesso
    Login e Obter Token
    Should Not Be Empty    ${TOKEN}
