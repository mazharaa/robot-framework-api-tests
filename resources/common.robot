*** Settings ***
Library    RequestsLibrary
Variables    ../variables/config.py

*** Keywords ***
Create Session for API
    Create Session    api    ${BASE_URL}    timeout=${API_TIMEOUT}

Get All
    [Arguments]    ${endpoint}
    ${response}=    GET On Session    api    ${endpoint}
    RETURN    ${response}

Post
    [Arguments]    ${endpoint}    ${data}
    ${response}=    POST On Session    api    ${endpoint}    json=${data}
    RETURN    ${response}

Put
    [Arguments]    ${endpoint}    ${data}
    ${response}=    PUT On Session    api    ${endpoint}    json=${data}
    RETURN    ${response}

Delete
    [Arguments]    ${endpoint}
    ${response}=    DELETE On Session    api    ${endpoint}
    RETURN    ${response}

Verify Status Code
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Integers    ${response.status_code}    ${expected_status}