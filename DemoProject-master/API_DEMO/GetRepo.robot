*** Settings ***
Metadata   Input Data File    http://localhost:63342/Training/TestData/UsersData.xlsx
Resource    ../API_DEMO/Resources.robot
Library     DataDriver     file=../TestData/UsersData.xlsx  sheet_name=ValidUsers
#Library     DataDriver     file=../TestData/API_Repos.csv
Suite Setup  log  creating session
Suite Teardown  log     closing the session
Test Setup  log     Started execution of test case
Test Teardown  log   Completion of executing the test case
Test Template  Get Repo Test

*** Test Cases ***
Get Repos Test with ${user}

*** Keywords ***
Get Repo Test
    [Arguments]     ${user}     ${expected_code}
    Get Repo    ${user}      ${expected_code}
