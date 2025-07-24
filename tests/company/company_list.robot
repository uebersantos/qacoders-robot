*** Settings ***
Library    RequestsLibrary
Resource   ../../resource/variables.robot
Resource   ../../resource/login.robot


*** Test Cases ***
Listar Empresas com Sucesso
    Login e Obter Token
    ${headers}=    Create Dictionary    authorization=${TOKEN}
    Create Session    api    ${BASE_URL}    verify=${false}
    ${response}=    GET On Session    api    /api/company/   headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
    