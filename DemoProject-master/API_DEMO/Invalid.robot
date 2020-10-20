*** Settings ***
Metadata   Input Data File    http://localhost:63342/Training/TestData/UsersData.xlsx
Resource    ../API_DEMO/Resources.robot
Library     DataDriver     file=../TestData/UsersData.xlsx  sheet_name=InvalidUsers
#Library     DataDriver     file=../TestData/API_InvalidUsers.csv
Suite Setup  log  creating session
Suite Teardown  log     closing the session
Test Setup  log     Started execution of test case
Test Teardown  log   Completion of executing the test case
Test Template  InvalidTest

*** Test Cases ***
Users Test with ${user}

*** Keywords ***
InvalidTest
    [Arguments]     ${user}     ${expected_code}
    Invalid Users    ${user}        ${expected_code}
