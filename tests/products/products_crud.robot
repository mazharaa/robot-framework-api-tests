*** Settings ***
Resource    ../../resources/api_keywords.robot

*** Test Cases ***
TC001 - Get All Products
    [Documentation]    Verify GET all products returns 200
    Create Session for API
    ${response}=    Get All Products
    Verify Status Code    ${response}    200
    Should Not Be Empty    ${response.json()}[products]

TC002 - Get Single Products
    [Documentation]    Verify GET single product by ID
    Create Session for API
    ${response}=    Get Single Product    1
    Verify Status Code    ${response}    200
    Should Be Equal As Integers    ${response.json()}[id]    1

TC003 - Add New Product
    [Documentation]    Verify POST new product
    Create Session for API
    ${response}=    Add New Product    Test Product    99    Electronics
    Verify Status Code    ${response}    201
    Should Be Equal    ${response.json()}[title]    Test Product
    Should Be Equal As Integers    ${response.json()}[price]    99
    Should Be Equal    ${response.json()}[category]    Electronics

TC004 - Update Product
    [Documentation]    Verify PUT update product
    Create Session for API
    ${response}=    Update Product    1    Updated Product
    Verify Status Code    ${response}    200
    Should Be Equal    ${response.json()}[title]    Updated Product

TC005 - Delete Product
    [Documentation]    Verify DELETE product
    Create Session for API
    ${response}=    Delete Product    1
    Verify Status Code    ${response}    200
    Should Be True    ${response.json()}[isDeleted]

TC006 - Get Product Search Results
    [Documentation]    Verify GET Search Results by query
    Create Session for API
    ${response}=    Get Product Search Result    laptop
    Verify Status Code    ${response}    200
    Should Not Be Empty    ${response.json()}[products]