*** Settings ***
Documentation  This test will valid the login using invalid components
Library  SeleniumLibrary
Resource    ../UI_DEMO/Resources.robot
Library     DataDriver     file=../TestData/WebappData.xlsx  sheet_name=LoginDetails
#Library     DataDriver     file=../TestData/UI_InvalidUsers.csv
Suite Setup  Open my Browser
Suite Teardown  Close browsers
Test Setup  log     Started execution of test case
Test Teardown  log   Completion of executing the test case
Test Template  Invalid Login

*** Test Cases ***
Login with user ${email} and password  ${password}

*** Keywords ***
Invalid Login
    [Arguments]    ${email}     ${password}
    Set Implicit Time
    Go to Loginpage
    Input Email     ${email}
    Input Password  ${password}
    Log in
    Error message should be visible
