*** Settings ***
Documentation  This test will register the new user with the given details
Library  SeleniumLibrary
Resource    ../UI_DEMO/Resources.robot
Library     DataDriver     file=../TestData/WebappData.xlsx  sheet_name=UserDetails
#Library     DataDriver     file=../TestData/UI_UserDetails.csv
Suite Setup  Open my Browser
Suite Teardown  Close browsers
Test Setup  log     Started execution of test case
Test Teardown  Log out
Test Template  Registration Test

*** Test Cases ***
Register with user ${first}  ${last}

*** Keywords ***
Registration Test
    [Arguments]    ${email}      ${password}    ${first}    ${last}     ${day}   ${month}    ${year}  ${category}    ${item}
    Set Implicit Time
    Go to Loginpage
    Register    ${email}      ${password}    ${first}    ${last}     ${day}   ${month}    ${year}
    Search Item     ${category}    ${item}
    Place Filters
    Going to cart








