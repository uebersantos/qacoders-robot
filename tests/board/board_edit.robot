*** Settings ***
Resource    ../../resource/login.robot
Resource    ../../resource/board.robot

*** Test Cases ***
Editar Diretoria com Sucesso
    [Documentation]    Faz login, cadastra diretoria e realiza a edição com sucesso
    Login e Obter Token
    Gerar Nome Diretoria
    Cadastrar Diretoria
    Gerar Nome Diretoria
    Editar Diretoria

Editar Diretoria com ID Inexistente
    [Documentation]    Valida se o sistema retorna erro ao editar diretoria com ID inválido
    Login e Obter Token
    Gerar Nome Diretoria
    Cadastrar Diretoria
    Gerar Nome Diretoria
    Editar Diretoria Com ID Inexistente

Editar Diretoria com Caracteres Inválidos
    [Documentation]    Valida se a API rejeita nomes de diretoria com caracteres não permitidos
    Login e Obter Token
    Gerar Nome Diretoria
    Cadastrar Diretoria
    Gerar Nome Diretoria
    Editar Diretoria Com Caracteres Inválidos

Editar Diretoria com Campo boardName Vazio
    [Documentation]    Valida se a API retorna erro quando o campo boardName é vazio
    Login e Obter Token
    Gerar Nome Diretoria
    Cadastrar Diretoria
    Gerar Nome Diretoria
    Editar Diretoria Com Campo Vazio

