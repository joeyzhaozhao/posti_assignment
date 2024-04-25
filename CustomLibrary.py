"""
CustomLibrary - A custom Python library for web automation using Selenium.
This library provides a set of utility functions for interacting with web elements, calculating cart totals, and validating postal codes.
"""

# Import necessary libraries
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import NoSuchElementException, TimeoutException
import re

# Get instance of SeleniumLibrary
SL = BuiltIn().get_library_instance("SeleniumLibrary")

class CustomLibrary:
    @staticmethod
    def click_button_by_xpath(xpath):
        """Clicks a button identified by XPath."""
        try:
            driver = SL.driver
            # Wait for the button to be clickable
            button = WebDriverWait(driver, 10).until(
                EC.element_to_be_clickable((By.XPATH, xpath))
            )
            driver.execute_script("arguments[0].click();", button)
            BuiltIn().log(f"Button with XPath '{xpath}' clicked successfully.")
        except NoSuchElementException:
            BuiltIn().log(f"Button with XPath '{xpath}' not found.")
        except TimeoutException:
            BuiltIn().log(f"Button with XPath '{xpath}' not clickable within the timeout.")

    @staticmethod
    def get_text_by_id(element_id):
        """Gets the text of an element identified by ID."""
        try:
            driver = SL.driver
            element = driver.find_element(By.ID, element_id)
            return element.text
        except NoSuchElementException:
            BuiltIn().log(f"Element with ID '{element_id}' not found.")
            return None

    @staticmethod
    def get_quantity_from_cart(xpath):
        """Gets the quantity from a cart identified by XPath."""
        try:
            driver = SL.driver
            element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located((By.XPATH, xpath))
            )
            quantity = element.text
            return int(quantity)
        except TimeoutException:
            BuiltIn().log(f"Element with XPath '{xpath}' not found or not visible.")
            return None

    @staticmethod
    def calculate_delivery_fee(cart_total):
        """Calculates delivery fee based on cart total."""
        try:
            cart_total = float(cart_total)
            return 5 if cart_total < 45 else 0
        except ValueError:
            BuiltIn().log("Invalid cart total.")
            return None

    @staticmethod
    def calculate_total(cart_total, delivery_fee):
        """Calculates total amount based on cart total and delivery fee."""
        try:
            return float(cart_total) + float(delivery_fee)
        except ValueError:
            BuiltIn().log("Invalid input for cart total or delivery fee.")

    @staticmethod
    def is_valid_postal_code(postal_code):
        """Validates if the postal code is exactly 5 digits."""
        if re.match(r'^\d{5}$', postal_code):
            return True
        return False
