*** Variables ***
# Login Page
${USERNAME_FIELD}       id:user-name
${PASSWORD_FIELD}       id:password
${LOGIN_BUTTON}         id:login-button
${ERROR_MESSAGE}        Epic sadface: Username and password do not match any user in this service
${PAGE_TITLE}           Swag Labs

# Menu
${BURGER_MENU_BTN}      id:react-burger-menu-btn
${BURGER_CROSS_BTN}     id:react-burger-cross-btn
${LOGOUT_LINK}          id:logout_sidebar_link

# Products
${SORT_DROPDOWN}        class:product_sort_container

# Shopping Cart
${CART_LINK}            class:shopping_cart_link
${CART_BADGE}           class:shopping_cart_badge
${CART_PAGE_TITLE}      Your Cart
${CART_REMOVE_BTN}      css:button[data-test^="remove-"]

# Product buttons (dynamic)
${ADD_TO_CART_BTN}      id:add-to-cart-
${CHECKOUT_BTN}    id:checkout
${CONTINUE_BTN}    id:continue
${FINISH_BTN}    id:finish
${BACK_HOME_BTN}    id:back-to-products
${CHECKOUT_PAGE_TITLE}    Checkout: Your Information
${CHECKOUT_OVERVIEW_TITLE}    Checkout: Overview
${CHECKOUT_FIRST_NAME_FIELD}    id:first-name
${CHECKOUT_LAST_NAME_FIELD}    id:last-name
${CHECKOUT_ZIP_FIELD}    id:postal-code