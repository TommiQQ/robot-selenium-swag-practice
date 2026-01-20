*** Settings ***
Library    SeleniumLibrary
Resource    locators.robot

*** Variables ***
${URL}    https://www.saucedemo.com/
${INVALID_USERNAME}    invalid
${INVALID_PASSWORD}    password
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

@{USERS}    standard_user    problem_user    performance_glitch_user    error_user    visual_user

@{PRODUCT_ITEMS}    sauce-labs-backpack    sauce-labs-bike-light    sauce-labs-bolt-t-shirt    sauce-labs-fleece-jacket    sauce-labs-onesie    test.allthethings()-t-shirt-(red)
&{PRODUCT_MAPPING}    1=sauce-labs-backpack    2=sauce-labs-bike-light    3=sauce-labs-bolt-t-shirt    4=sauce-labs-fleece-jacket    5=sauce-labs-onesie    6=test.allthethings()-t-shirt-(red)

@{MENU_ITEMS}    All Items    About    Logout    Reset App State

&{SORT_MAPPING}    Name Asc=Name (A to Z)    Name Desc=Name (Z to A)    Price Asc=Price (low to high)    Price Desc=Price (high to low)
@{SORT_ITEMS}    Name (A to Z)    Name (Z to A)    Price (low to high)    Price (high to low)