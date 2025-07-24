*** Settings ***
Library    RequestsLibrary
Resource   ../../resource/variables.robot
Resource   ../../resource/login.robot

*** Test Cases ***
Contar Diretoria com Sucesso
    Login e Obter Token
    ${headers}=    Create Dictionary    authorization=${TOKEN}
    Create Session    api    ${BASE_URL}    verify=${False}
    ${response}=    GET On Session    api    /api/board/count    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
    ${count}=    Set Variable    ${response.json()['count']}
    Should Be True    ${count} > 0