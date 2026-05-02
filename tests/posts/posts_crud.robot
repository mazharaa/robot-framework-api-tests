*** Settings ***
Resource    ../../resources/common.robot
Variables    ../../variables/config.py

*** Test Cases ***
TC001 - Get All Posts
    Create Session for API
    ${response}=    GET On Session    api    ${POSTS_ENDPOINT}
    Verify Status Code    ${response}    200

TC002 - Get Single Post
    Create Session for API
    ${response}=    GET On Session    api    ${POSTS_ENDPOINT}/1
    Verify Status Code    ${response}    200

TC003 - Create New Post
    Create Session for API
    ${data}=    Create Dictionary    title=Test Post    body=Test Body    userId=1
    ${response}=    POST On Session    api    ${POSTS_ENDPOINT}/add    json=${data}
    Verify Status Code    ${response}    201
    Should Be Equal As Integers  ${response.json()}[userId]    1
    Should Be Equal    ${response.json()}[title]    Test Post
    Should Be Equal    ${response.json()}[body]    Test Body

TC004 - Delete Post
    Create Session for API
    ${response}=    DELETE On Session    api    ${POSTS_ENDPOINT}/1
    Verify Status Code    ${response}    200
    Should Be True    ${response.json()}[isDeleted]