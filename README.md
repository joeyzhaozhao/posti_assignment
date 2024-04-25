# Instructions of Running script

To run this script:
1. Install Python, Robot Framework, and Robot Framework seleniumlibrary.
2. Ensure Chrome and chromedriver, Firefox and geckodriver, Edge and edgedriver are installed.
3. Navigate to the script folder in the command line.
4. Execute the script using the following command:
   - robot -v <browser_name> --outputdir ./test_results test_cases.robot
   - Replace `<browser_name>` with the desired browser (chrome, firefox, or edge). 
   - Test results will be saved in the test_results folder.
5. If you'd like the test to run in browser mode instead of headless mode, please remove the `add_argument("--headless")` from the keywords.resource file -> Setup and Open Posti Page keywords.

All detailed description of test cases and test results can be found on test_report.md.