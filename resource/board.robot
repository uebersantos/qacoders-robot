*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
Resource   variables.robot

*** Keywords ***
Gerar Nome Diretoria
    ${palavra_randomica}=    Generate Random String    length=9    chars=[LETTERS]
    ${palavra_randomica}=    Convert To Lower Case    B${palavra_randomica}
    Set Test Variable    ${BOARD_NAME}    ${palavra_randomica}
    Log    ${BOARD_NAME}

Cadastrar Diretoria
    [Documentation]    Cadastra uma diretoria e armazena o ID
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=${TOKEN} 
    ${body}=    Create Dictionary    boardName=${BOARD_NAME}
    ${response}=    POST On Session    api   ${BASE_URL}/api/board   json=${body}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    201
    ${json}=    Set Variable    ${response.json()}
    ${board_id}=    Set Variable    ${json['newBoard']['_id']}
    Set Suite Variable    ${BOARD_ID}    ${board_id}

Editar Diretoria
    [Documentation]    Edita uma diretoria existente usando o ID salvo
    ${headers}=    Create Dictionary    Content-Type=application/json        Authorization=${TOKEN} 
    ${body}=    Create Dictionary    boardName=${BOARD_NAME}
    ${response}=    PUT On Session    api    ${BASE_URL}/api/board/${BOARD_ID}    json=${body}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${json['msg']}    Cadastro atualizado com sucesso.
     

Editar Diretoria Com ID Inexistente
    [Documentation]    Tenta editar uma diretoria com um ID inexistente
    ${headers}=    Create Dictionary    Content-Type=application/json        Authorization=${TOKEN} 
    ${body}=       Create Dictionary    boardName=${BOARD_NAME}
    ${fake_id}=    Generate Random String    24    chars=0123456789abcdef
    ${response}=   PUT On Session    api    ${BASE_URL}/api/board/${fake_id}    json=${body}    headers=${headers}    expected_status=400
    
    

Editar Diretoria Com Caracteres Inválidos
    [Documentation]    Tenta editar uma diretoria com caracteres inválidos no nome
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=${TOKEN} 
    ${body}=       Create Dictionary    boardName=@@@@@###$$$
    ${response}=   PUT On Session    api    ${BASE_URL}/api/board/${BOARD_ID}    json=${body}    headers=${headers}    expected_status=400


Editar Diretoria Com Campo Vazio
    [Documentation]    Tenta editar uma diretoria deixando o boardName vazio
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=${TOKEN} 
    ${body}=       Create Dictionary    boardName=
    ${response}=   PUT On Session    api    ${BASE_URL}/api/board/${BOARD_ID}    json=${body}    headers=${headers}     expected_status=400
