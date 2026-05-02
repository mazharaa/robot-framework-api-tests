*** Settings ***
Resource    common.robot
Variables    ../variables/config.py

*** Keywords ***
Get All Products
    ${response}=    GET On Session    api    ${PRODUCTS_ENDPOINT}
    RETURN    ${response}

Get Single Product
    [Arguments]    ${product_id}
    ${response}=    GET On Session    api    ${PRODUCTS_ENDPOINT}/${product_id}
    RETURN    ${response}

Get Product Search Result
    [Arguments]    ${query}
    ${response}=    GET On Session    api    url=${PRODUCTS_ENDPOINT}/search?q=${query}
    RETURN    ${response}

Add New Product
    [Arguments]    ${name}    ${price}    ${category}
    ${data}=    Create Dictionary    title=${name}    price=${price}    category=${category}
    ${response}=    POST On Session    api    ${PRODUCTS_ENDPOINT}/add    json=${data}
    RETURN    ${response}

Update Product
    [Arguments]    ${product_id}    ${name}
    ${data}=    Create Dictionary    title=${name}
    ${response}=    PUT On Session    api    ${PRODUCTS_ENDPOINT}/${product_id}    json=${data}
    RETURN    ${response}

Delete Product
    [Arguments]    ${product_id}
    ${response}=    DELETE On Session    api    ${PRODUCTS_ENDPOINT}/${product_id}
    RETURN    ${response}

Get All Users
    ${response}=    GET On Session    api    ${USERS_ENDPOINT}
    RETURN    ${response}

Get Single User
    [Arguments]    ${user_id}
    ${response}=    GET On Session    api    ${USERS_ENDPOINT}/${user_id}
    RETURN    ${response}

Create User
    [Arguments]    ${firstName}    ${lastName}    ${email}
    ${data}=    Create Dictionary    firstName=${firstName}    lastName=${lastName}    email=${email}
    ${response}=    POST On Session    api    ${USERS_ENDPOINT}/add    json=${data}
    RETURN    ${response}

Update User
    [Arguments]    ${user_id}    ${firstName}
    ${data}=    Create Dictionary    firstName=${firstName}
    ${response}=    PUT On Session    api    ${USERS_ENDPOINT}/${user_id}    json=${data}
    RETURN    ${response}

Delete User
    [Arguments]    ${user_id}
    ${response}=    DELETE On Session    api    ${USERS_ENDPOINT}/${user_id}
    RETURN    ${response}