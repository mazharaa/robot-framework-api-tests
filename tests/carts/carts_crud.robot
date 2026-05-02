*** Settings ***
Resource    ../../resources/common.robot
Variables    ../../variables/config.py

*** Test Cases ***
TC001 - Get All Carts
    Create Session for API
    ${response}=    GET On Session    api    ${CARTS_ENDPOINT}
    Verify Status Code    ${response}    200

TC002 - Get Single Cart
    Create Session for API
    ${response}=    GET On Session    api    ${CARTS_ENDPOINT}/1
    Verify Status Code    ${response}    200
    Should Be Equal As Integers    ${response.json()}[id]    1

TC003 - Create New Cart
    Create Session for API
    ${prodcut1}=    Create Dictionary    id=1    quantity=2
    ${prodcut2}=    Create Dictionary    id=3    quantity=4
    ${products}=    Create List    ${prodcut1}    ${prodcut2}
    ${data}=    Create Dictionary    userId=1    products=${products}
    ${response}=    POST On Session    api    ${CARTS_ENDPOINT}/add    json=${data}
    Verify Status Code    ${response}    201
    Should Be Equal As Integers    ${response.json()}[products][0][id]    1
    Should Be Equal As Integers    ${response.json()}[products][0][quantity]    2
    Should Be Equal As Integers    ${response.json()}[products][1][id]    3
    Should Be Equal As Integers    ${response.json()}[products][1][quantity]    4

TC004 - Delete Cart
    Create Session for API
    ${response}=    DELETE On Session    api    ${CARTS_ENDPOINT}/1
    Verify Status Code    ${response}    200
    Should Be True    ${response.json()}[isDeleted]
