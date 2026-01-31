*** Settings ***
Documentation    Simple first test
Resource    Resources/common.robot
Resource    Resources/keywords.robot
Resource    Resources/locators.robot

Test Setup    Setup Chrome And Open URL    ${URL}
Test Teardown    Close All Browsers

*** Test Cases ***
Login With All Users
    # Setup is done in Test Setup
    FOR    ${user}    IN    @{USERS}
        Login Correct    ${user}    ${PASSWORD}
        Page Should Contain    Products
        Logout
    END

Login And Menu
    #Login
    Login Incorrect    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Login Correct    ${USERNAME}    ${PASSWORD}
    #Menu and sorting
    Menu Should Contain    #List from common.robot
    Verify Sort Options
    Select Sort Option    Price Asc
    Open Shopping Cart
    Clear Shopping Cart If Not Empty
    #Menu items
    Go To Menu Item    All Items
    Go To Menu Item    About
    Go Back            #Need to go back from About page
    #
    Logout

Login And Shopping
    #Login
    Login Correct    ${USERNAME}    ${PASSWORD}
    #Add items to cart
    Add Item To Cart    1
    Add Item To Cart    3
    Add Item To Cart    5
    #Open cart and verify items
    Open Shopping Cart
    Verify Product In Cart    1
    Verify Product In Cart    3
    Verify Product In Cart    5
    Click Button    ${CHECKOUT_BTN}
    Page Should Contain    ${CHECKOUT_PAGE_TITLE}
    Input Text    ${CHECKOUT_FIRST_NAME_FIELD}    ${ADDRESS_FIRST_NAME}
    Input Text    ${CHECKOUT_LAST_NAME_FIELD}    ${ADDRESS_LAST_NAME}
    Input Text    ${CHECKOUT_ZIP_FIELD}    ${ADDRESS_ZIP}
    Click Button    ${CONTINUE_BTN}
    Page Should Contain    ${CHECKOUT_OVERVIEW_TITLE}
    Click Button    ${FINISH_BTN}
    Page Should Contain    Thank you for your order!
    Click Button    ${BACK_HOME_BTN}
    Open Shopping Cart
    Page Should Not Contain    ${CART_REMOVE_BTN}
    #Logout
    Go To Menu Item    Logout
