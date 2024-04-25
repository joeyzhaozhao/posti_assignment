*** Settings ***
Documentation     Resource file containing keywords for creating automation scripts for Posti website.
Library                         SeleniumLibrary
Library                         CustomLibrary.py

*** Keywords ***
Setup and Open Posti Page
    [Documentation]   Opens the Posti website in a specified browser, handles browser options, and maximizes the window.
    Open Browser     ${HOME_URL}        ${BROWSER}
    ...     options=add_argument("--disable-web-security"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")
    Maximize Browser Window

Handle Cookie Popup
    Wait Until Element Is Visible         ${COOKIE_POP_UP_WINDOW}
    ${popup_present}=    Run Keyword And Return Status    Element Should Be Visible    ${COOKIE_POP_UP_WINDOW}
    Run Keyword If    ${popup_present}    Click Button    ${ACCEPT_COOKIE_BUTTON}

Click All Stamps Button
    Click Button By Xpath    ${ALL_STAMPS_BUTTON}
    Verify Stamps Page Redirect

Verify Stamps Page Redirect
    Switch Window               NEW
    Wait Until Page Contains    ${STAMP_PAGE_TEXT}

Add Stamp To Cart
    [Arguments]    ${first_selection_xpath}        ${second_selection_xpath}
    ${button_visible}=    Run Keyword And Return Status    Element Should Be Visible   ${first_selection_xpath}
    Run Keyword If    ${button_visible}    Click Button By Xpath    ${first_selection_xpath}
    ...    ELSE       Click Button By Xpath    ${second_selection_xpath}

Verify Cart Update
    ${acutal_quantity}=    Get Quantity From Cart  ${CART_QUANTITY}
    Should Be Equal As Numbers     ${acutal_quantity}      ${EXPECTED_QUANTITY}

Click Button To Navigate
    [Arguments]             ${element_xpath}            ${page_text}
    Click Button By Xpath                               ${element_xpath}
    Wait Until Page Contains                            ${page_text}

Verify Cart Update On Click
    [Arguments]    ${num_of_clicks}    ${increase}
    Wait Until Element Is Visible         ${QUANTITY_INCREASE_BUTTON}
    ${acutal_quantity}=    Get Quantity From Cart    ${CART_QUANTITY}
    ${num_clicks}=    Convert To Integer    ${num_of_clicks}
    ${increment}=    Evaluate    1 if '${increase}'=='increase' else -1
    FOR    ${index}    IN RANGE    ${num_clicks}
        Run Keyword If    '${increase}'=='increase'
        ...    Click Button By Xpath            ${QUANTITY_INCREASE_BUTTON}
        ...    ELSE    Click Button By Xpath    ${QUANTITY_DECREASE_BUTTON}
        Sleep    5s
        ${new_quantity}=    Get Quantity From Cart    ${CART_QUANTITY}
        ${updated_quantity}=    Evaluate    max(${acutal_quantity} + ${increment} * (${index} + 1), 0)
        Should Be Equal As Numbers    ${new_quantity}    ${updated_quantity}
    END

Get Numeric Value
    [Arguments]    ${element_id}
    ${element_text}=     Get Text By Id   ${element_id}
    ${numeric_value}=    Evaluate    float(${element_text.replace('€', '').strip()})
    [Return]    ${numeric_value}

Calculate Delivery Fee For The Check Out
    ${cart_subtotal_value}=   Get Numeric Value    ${CART_SUBTOTAL_VALUE_ID}
    ${delivery_fee}=    Calculate Delivery Fee     ${CART_SUBTOTAL_VALUE}
    ${expected_cart_summary}=    Calculate Total   ${cart_subtotal_value}  ${delivery_fee}
    Log    Cart Total: €${cart_subtotal_value}
    Log    Delivery Fee: €${delivery_fee}
    Log    Total Payment: €${expected_cart_summary}
    ${actual_sumary_value}=    Get Numeric Value   ${CART_TOTAL_VALUE_ID}
    Should Be Equal As Numbers    ${expected_cart_summary}   ${actual_sumary_value}

Input Text Into Form
    [Arguments]            ${input_area_id}       ${input_text}
    Wait Until Element is Visible                 ${input_area_id}
    Input Text             ${input_area_id}       ${input_text}      clear=${TRUE}

Filling Checkout Form
    Input Text Into Form    ${FIRST_NAME_ID}    ${FIRST_NAME_TEXT}
    Input Text Into Form    ${LAST_NAME_ID}      ${LAST_NAME_TEXT}
    Filling Address Into Form
    Input Text Into Form    ${CITY_ID}              ${CITY_TEXT}
    Input Text Into Form    ${EMAIL_ID}             ${EMAIL_TEXT}

Filling Address Into Form
    Wait Until Element Is Visible               ${ADDRESS_AREA}
    Click Element                               ${ADDRESS_AREA}
    Input Text     ${ADDRESS_INPUT_FILED}        ${ADDRESS_TEXT}

Check Post Code Format
    [Arguments]            ${input_post_code}
    Input Text Into Form   ${ZIP_CODE_ID}   ${input_post_code}
    ${post_code_is_valid}=    Is Valid Postal Code   ${input_post_code}
    Run Keyword If    ${post_code_is_valid}
    ...    Log    Valid postal code
    ...    ELSE   Alert Message Will Appear

Alert Message Will Appear
    Element Should Be Visible            ${ALERT_MESSAGE_XPATH}
    Element Should Contain               ${ALERT_MESSAGE_XPATH}           ${ALERT_MESSAGE}

Verify Information Area
    Wait Until Element is Visible        ${INFORMATION_AREA}
    Element Should Contain               ${INFORMATION_AREA}      ${EMAIL_TEXT}



