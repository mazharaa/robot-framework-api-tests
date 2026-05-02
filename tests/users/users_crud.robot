*** Settings ***
Resource    ../../resources/api_keywords.robot

*** Test Cases ***
TC001 - Get All Users
    [Documentation]    Verify GER all users retutn 200
    Create Session for API
    ${response}=    Get All Users
    Verify Status Code    ${response}    200
    Should Not Be Empty    ${response.json()}[users]

TC002 - Get Single User
    [Documentation]    Verify GET single user by ID
    Create Session for API
    ${response}=    Get Single User    1
    Verify Status Code    ${response}    200
    Should Be Equal As Integers    ${response.json()}[id]    1

TC003 - Add New User
    [Documentation]    Verify POST new user
    Create Session for API
    ${response}=    Create User    first    last    mail@mail.com
    Verify Status Code    ${response}    201
    Should Be Equal    ${response.json()}[firstName]    first
    Should Be Equal    ${response.json()}[lastName]    last
    Should Be Equal    ${response.json()}[email]    mail@mail.com

TC004 - Update User
    [Documentation]    Verify PUT update user
    Create Session for API
    ${response}=    Update User    1    update first name
    Verify Status Code    ${response}    200
    Should Be Equal As Integers    ${response.json()}[id]    1
    Should Be Equal    ${response.json()}[firstName]    update first name

TC005 - Delete User
    [Documentation]    Verify DELETE user
    Create Session for API
    ${response}=    Delete User    1
    Verify Status Code    ${response}    200
    Should Be True    ${response.json()}[isDeleted]