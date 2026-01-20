*** Settings ***
Documentation    Simple first test
Resource    Resources/common.robot
Resource    Resources/keywords.robot

*** Test Cases ***
Login With All Users
    Set Selenium Speed    0.5 seconds
    Open Chrome    ${URL}
    FOR    ${user}    IN    @{USERS}
        Login Correct    ${user}    ${PASSWORD}
        Page Should Contain    Products
        Logout
    END

Login And Menu
    Set Selenium Speed    0.5 seconds
    Open Chrome    ${URL}
    Login Incorrect    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Login Correct    ${USERNAME}    ${PASSWORD}
    Menu Should Contain    #the list is passed from common.robot
    Verify Sort Options
    Select Sort Option    Price Asc
    Open Shopping Cart
    Clear Shopping Cart If Not Empty
    Go To Menu Item    All Items
    # Shopping cart operations
    Add Item To Cart    1
    Open Shopping Cart
    Go To Menu Item    All Items
    Add Item To Cart    3
    Open Shopping Cart
    Clear Shopping Cart If Not Empty
    Logout