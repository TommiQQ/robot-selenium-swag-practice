*** Settings ***
Resource    common.robot
Resource    locators.robot

*** Keywords ***
Open Chrome
    [Arguments]    ${url}
    Open Browser    ${url}    chrome    options=add_argument("--guest")
    Maximize Browser Window

Login Incorrect
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}
    Page Should Contain    ${ERROR_MESSAGE}

Login Correct
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}
    Page Should Contain    ${PAGE_TITLE}

Menu Should Contain
    Click Button    ${BURGER_MENU_BTN}
    Capture Page Screenshot    hamburger_menu.png
    
    FOR    ${item}    IN    @{MENU_ITEMS}
        Page Should Contain    ${item}
    END
    
    Click Button    ${BURGER_CROSS_BTN}

Go To Menu Item
    [Arguments]    ${menu_item}
    Click Button    ${BURGER_MENU_BTN}
    Click Link    ${menu_item}

Verify Sort Options
    Click Element    ${SORT_DROPDOWN}
    Capture Page Screenshot    sort_options.png
    
    FOR    ${option}    IN    @{SORT_ITEMS}
        Page Should Contain    ${option}
    END

#Shopping cart
Open Shopping Cart
    Click Element    ${CART_LINK}
    Page Should Contain    ${CART_PAGE_TITLE}

Select Sort Option
    [Arguments]    ${short_option}
    ${option}=    Set Variable    ${SORT_MAPPING}[${short_option}]
    Select From List By Label    ${SORT_DROPDOWN}    ${option}

Add Item To Cart
    [Arguments]    ${product_number}
    ${product_name}=    Set Variable    ${PRODUCT_MAPPING}[${product_number}]
    Click Element    ${ADD_TO_CART_BTN}${product_name}

Clear Shopping Cart If Not Empty
    ${count}=    Get Element Count    ${CART_REMOVE_BTN}
    IF    ${count} > 0
        Log    Shopping cart not empty.    level=WARN
        Clear Shopping Cart
    ELSE
        Log    Shopping cart is already empty. ltem count: ${count}
    END

Verify Product In Cart
    [Arguments]    ${product_number}
    ${product_name}=    Set Variable    ${PRODUCT_NAMES}[${product_number}]
    Page Should Contain    ${product_name}

Clear Shopping Cart
    # Get count using Get Element Count
    ${count}=    Get Element Count    ${CART_REMOVE_BTN}
    Log    Found ${count} remove buttons in cart (using Get Element Count)
    
    # Get all buttons as WebElements
    ${buttons}=    Get WebElements    ${CART_REMOVE_BTN}
    ${button_count}=    Get Length    ${buttons}
    Log    Found ${button_count} remove buttons (using Get WebElements)
    
    # Verify counts match
    Run Keyword If    ${count} != ${button_count}
    ...    Log    WARNING: Count mismatch! Get Element Count=${count}, Get WebElements=${button_count}    level=WARN
    
    # Click all buttons
    FOR    ${button}    IN    @{buttons}
        Click Element    ${button}
        Sleep    0.5s
    END
    
    Log    Cleared ${count} items from shopping cart

Logout
    Click Button    ${BURGER_MENU_BTN}
    Click Element    ${LOGOUT_LINK}
    Page Should Contain Button    ${LOGIN_BUTTON}