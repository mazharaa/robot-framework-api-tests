*** Settings ***
Resource    ../../resources/common.robot
Variables    ../../variables/config.py

*** Test Cases ***
TC001 - User Login
    Create Session for API
    ${data}=    Create Dictionary    username=emilys    password=emilyspass
    ${response}=    POST On Session    api    ${AUTH_ENDPOINT}/login    json=${data}
    Verify Status Code    ${response}    200
    Should Not Be Empty    ${response.json()}[accessToken]

TC002 - Get Current User
    Create Session for API
    ${data}=    Create Dictionary    username=emilys    password=emilyspass
    ${login_response}=    POST On Session    api    ${AUTH_ENDPOINT}/login    json=${data}
    ${token}=    Set Variable    ${login_response.json()}[accessToken]
    ${headers}=    Create Dictionary    Authorization=${token}
    ${response}=    GET On Session    api    ${AUTH_ENDPOINT}/me    headers=${headers}
    Verify Status Code    ${response}    200

RC003 - Refresh Token
    Create Session for API
    ${data}=    Create Dictionary    username=emilys    password=emilyspass
    ${login_response}=    POST On Session    api    ${AUTH_ENDPOINT}/login    json=${data}
    ${refresh_token}=    Set Variable    ${login_response.json()}[refreshToken]
    ${data2}=    Create Dictionary    refreshToken=${refresh_token}
    ${response}=    POST On Session    api    ${AUTH_ENDPOINT}/refresh    json=${data2}
    Verify Status Code    ${response}    200