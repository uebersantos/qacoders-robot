*** Settings ***
Resource    ../../resource/login.robot
Resource    ../../resource/board.robot

*** Test Cases ***
Cadastrar Diretoria com Sucesso
    [Documentation]    Faz login e cadastra diretoria com sucesso
    Login e Obter Token
    Gerar Nome Diretoria
    Cadastrar Diretoria

Cadastrar Diretoria com Caracteres Inválidos
    [Documentation]    Faz login e tenta cadastra diretoria com caracteres inválidos
    Login e Obter Token
    Gerar Nome Diretoria
    Cadastrar Diretoria com Caracteres Inválidos 

Cadastrar Diretoria com Nome Vazio   
    [Documentation]    Faz login e tenta cadastra diretoria com cnome vazio
    Login e Obter Token
    Gerar Nome Diretoria
    Cadastrar Diretoria com Caracteres Inválidos 
