*** Settings ***
Documentation     Posti Stamp Shopping Test Suite
...               This suite verifies the functionality of a stamp shopping from posti website.
...               It covers various aspects includes adding stamps to the cart, updating the cart, navigating through the shopping flow, and checkout processes.
Resource          keywords.resource
Resource          variables.robot
Suite Setup       Setup and Open Posti Page
Suite Teardown    Close Browser

*** Test Cases ***
User Adds Desired Stamp To Cart
    [Tags]    AddToCart
    Handle Cookie Popup
    Click All Stamps Button
    Add Stamp To Cart      ${ADD_TO_CART_FIFTH_STAMP}    ${ADD_TO_CART_SIXTH_STAMP}
    Verify Cart Update

Verify Cart Updates on Increase and Decrease Button Click
    [Tags]    CartUpdate
    Click Button To Navigate     ${CART_BUTTON}       ${CART_PAGE_TEXT}
    Verify Cart Update On Click   3    increase
    Verify Cart Update On Click   2    decrease
    Calculate Delivery Fee For The Check Out

User Can Add Stamps and Continue Shopping, Then Proceed to Shopping Cart
    [Tags]    ShoppingFlow
    Click Button To Navigate    ${CONTINUE_SHOPPING_BUTTON}       ${STAMP_PAGE_TEXT}
    Add Stamp To Cart           ${ADD_TO_CART_SEVENTH_STAMP}       ${ADD_TO_CART_SIXTH_STAMP}
    Click Button To Navigate    ${CART_BUTTON}       ${CART_PAGE_TEXT}
    Calculate Delivery Fee For The Check Out
    Click Button To Navigate    ${CHECKOUT_BUTTON}      ${CHECK_OUT_PAGE_TEXT}

User Navigates to Checkout Page and Fills Checkout Form
    [Tags]    Checkout
    Click Button To Navigate    ${CHECKOUT_BUTTON}      ${CHECK_OUT_PAGE_TEXT}
    Filling Checkout Form
    Check Post Code Format      ${INVALID_POSTCODE}
    Check Post Code Format      ${VALID_POSTCODE}

User Proceeds to Next Step After Filling Form Correctly
    [Tags]    FormValidation
    Click Button To Navigate    ${SAVE_AND_CONTINUE_BTN}    ${CONTINUE_PAGE_TEXT}
    Verify Information Area
