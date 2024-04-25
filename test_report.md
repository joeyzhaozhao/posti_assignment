# Test Report

## Objective:
The test aims to ensure users can add stamps, navigate shopping, and checkout smoothly.

## Scope: 
Test functionalities:
- Add stamps to cart.
- Navigate shopping process.
- Calculate delivery fee before checkout.
- Fill checkout form.
- Validate postal code format.
- Verify users can proceed after filling form correctly.

## Approach:
We'll use Robot Framework for automated testing. The scripts will simulate user actions and verify expected outcomes, utilizing Selenium library and custom keywords for interaction with the application.

# Detailed Description for Each Test Case

## Test Case 1: User adds desired stamp to cart
**Objective:** Verify users can add a desired stamp to their cart on the Posti.fi/en website.

**Steps:**
- Handle Cookie Popup if displayed.
- Click "All stamps" button on the homepage.
- Add the desired stamp to the cart. If out of stock, choose alternative options.
- Verify cart updates with the correct quantity.
**Outcome:** 
User successfully adds desired stamp to cart, and cart quantity updates accordingly.

## Test Case 2: Verify cart updates on increase and decrease button click
**Objective:** Ensure cart updates correctly when user clicks increase and decrease buttons, and calculate delivery fee.

**Steps:**
- Click on cart button to navigate to cart page.
- Increase cart quantity by 3 and verify update.
- Decrease cart quantity by 2 and verify update.
- Calculate delivery fee based on final cart total.
**Outcome:** 
Cart quantity updates correctly; delivery fee calculated accurately.

## Test Case 3: User can add stamps and continue Shopping, then proceed to shopping cart
**Objective:** Verify users can add stamps, continue shopping, and proceed to shopping cart.

**Steps:**
- Ensure "Continue Shopping" option is available on cart page.
- Add another stamp to cart and continue shopping.
- Navigate to shopping cart.
- Calculate delivery fee and proceed to checkout.
**Outcome:** 
Users can add stamps, continue shopping, and proceed to checkout without issues.

## Test Case 4: User navigates to checkout page and fills checkout form
**Objective:** Ensure users can navigate to checkout page, fill out form, and validate postal code format.

**Steps:**
- Click on "Checkout" button.
- Fill out checkout form.
- Enter invalid postal code format and verify alert.
- Enter valid postal code format.
**Outcome:** 
Users can navigate to checkout, fill out form, and correct postal code format is validated.

## Test Case 5: User proceeds to next step after filling form correctly
**Objective:** Verify users can proceed to next step after filling checkout form correctly.

**Steps:**
- Click "Save and Continue" button.
- Verify information area on next page.
**Outcome:** 
Users can proceed to next checkout step after filling form correctly; information displayed accurately.


# Test Results
| Test Case                                                 | Expected Outcome                                                | Actual Outcome            | Status |
|-----------------------------------------------------------|-----------------------------------------------------------------|---------------------------|--------|
| User adds desired stamp to cart                           | Cart updates with correct quantity                              | Same as expected outcome  | Pass   |
| Verify cart updates on increase and decrease button click | Cart and fees update correctly                                  | Same as expected outcome  | Pass   |
| User can add stamps and continue shopping, then checkout  | Successful addition to cart and checkout navigation             | Same as expected outcome  | Pass   |
| User navigates to checkout page and fills checkout form   | Form accepts valid input and validates postal code correctly    | Same as expected outcome  | Pass   |
| User proceeds to next step after filling form correctly   | Correct transition to next step and accurate information display| Same as expected outcome  | Pass   |

# Example of Test Report
<img width="452" alt="image" src="https://github.com/joeyzhaozhao/posti_assignment/assets/668344/94eb1ac5-b64b-437b-8855-051ca9cb0e03">



