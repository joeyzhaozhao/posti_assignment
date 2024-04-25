*** Variables ***
${HOME_URL}                     https://posti.fi/en
${COOKIE_POP_UP_WINDOW}         id=onetrust-banner-sdk
${ACCEPT_COOKIE_BUTTON}         id=onetrust-accept-btn-handler
${ALL_STAMPS_BUTTON}            //*[@id="send-letters-and-postcards-with-stamps"]/div[2]/div/div/a/button/span
${CATEGORY_NAME}                For letters and cards in Finland
${STAMP_PAGE_TEXT}              Stamps
${CART_PAGE_TEXT}               Summary
${ADD_TO_CART_FIFTH_STAMP}      //*/section[1]/div/div/div[2]/ul/li[5]/div/div[3]/div/button
${ADD_TO_CART_SIXTH_STAMP}      //*/section[1]/div/div/div[2]/ul/li[6]/div/div[3]/div/button
${ADD_TO_CART_SEVENTH_STAMP}    //*/section[1]/div/div/div[2]/ul/li[7]/div/div[3]/div/button
${CART_QUANTITY}                //*/header/div/div/div[2]/ul/li[2]/span/span
${EXPECTED_QUANTITY}            1
${CART_BUTTON}                  //*/header/div/div/div[2]/ul/li[2]/span/li/a
${QUANTITY_INCREASE_BUTTON}     //*/section[1]/div[2]/div/div[2]/ul/li/div/div[3]/div[1]/button[3]
${QUANTITY_DECREASE_BUTTON}     //*/section[1]/div[2]/div/div[2]/ul/li/div/div[3]/div[1]/button[2]
${CART_SUBTOTAL_VALUE_ID}       cart-totals-subtotal-value
${CART_TOTAL_VALUE_ID}          cart-totals-total-value
${CHECKOUT_BUTTON}              //button[@id="cart-totals-cta"]
${CHECK_OUT_PAGE_TEXT}          Your information
${CONTINUE_SHOPPING_BUTTON}     //*/div[3]/section[1]/div[1]/button
${FIRST_NAME_ID}                id=billing-firstname-field
${FIRST_NAME_TEXT}              Testing
${LAST_NAME_ID}                 id=billing-lastname-field
${LAST_NAME_TEXT}               Engineer
${ADDRESS_AREA}                 //*[@id="billing-domestic"]/div/div
${ADDRESS_INPUT_FILED}          id=billing
${ADDRESS_TEXT}                 Fake address, some builiding a9
${ZIP_CODE_ID}                  id=billing-postcode-field
${ALERT_MESSAGE_XPATH}          //*/section[1]/div[2]/div/div/div[1]/ol/li[1]/form/div[7]/div[2]/div[1]/p
${ALERT_MESSAGE}                Value must be in the following form:
${INVALID_POSTCODE}             AAAAA
${VALID_POSTCODE}               12345
${CITY_ID}                      id=billing-city-field
${CITY_TEXT}                    HELSINKI
${EMAIL_ID}                     id=billing-email-field
${EMAIL_TEXT}                   test.account@posti.com
${SAVE_AND_CONTINUE_BTN}        //button[@id="checkoutNexBtn"]
${INFORMATION_AREA}             //*/section[1]/div[2]/div/div/div[1]/ol/li[1]/div[2]
${CONTINUE_PAGE_TEXT}           Shipping address