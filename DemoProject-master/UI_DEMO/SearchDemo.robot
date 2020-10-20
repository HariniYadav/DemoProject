*** Settings ***
Documentation  This test will search the items
Library  SeleniumLibrary
Resource    ../UI_DEMO/Resources.robot
Library     DataDriver     file=../TestData/WebappData.xlsx  sheet_name=Items
#Library     DataDriver     file=../TestData/UI_Items.csv
Suite Setup  Open my Browser
Suite Teardown  Close browsers
Test Setup  log   Started execution of test case
Test Teardown  log   Completion of executing the test case
Test Template  Search items

*** Test Cases ***
Search for items of ${category} and ${item}

*** Keywords ***
Search items
    [Arguments]  ${category}    ${item}
    Set Implicit Time
    Search Item     ${category}    ${item}
    Place Filters
    Scrolling in Page
    Going to cart


