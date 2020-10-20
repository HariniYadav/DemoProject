*** Settings ***
Documentation  This is a Resource file
Library  RequestsLibrary

*** Variables ***
${base_url}     https://api.github.com

*** Keywords ***

Validate User
    [Documentation]     Verifying the existence of user account in GITHUB
    [Arguments]     ${user}     ${expected_code}
    create session      mysession     ${base_url}
    ${response}=    get request     mysession    ${user}
    ${actual_code}      convert To string     ${response.status_code}
    should be equal     ${actual_code}        ${expected_code}
    ${body}=     convert to string  ${response.content}
    should not contain      ${body}  Not

Get Repo
    [Documentation]     Retriving the repositories a user having
    [Arguments]     ${user}     ${expected_code}
    create session      mysession     ${base_url}
    ${response}=    get request     mysession    ${user}
    ${actual_code}      convert To string     ${response.status_code}
    should be equal     ${actual_code}        ${expected_code}
    ${body}=     convert to string  ${response.content}
    ${json} =  set variable  ${response.json()}
    ${repos}=     set variable    ${json["public_repos"]}
    log     The user has ${repos} repositories

Invalid Users
    [Documentation]     Valiating the negative test case by using invalid users
    [Arguments]     ${user}     ${expected_code}
    create session      mysession     ${base_url}
    ${response}=    get request     mysession    ${user}
    ${actual_code}      convert To string     ${response.status_code}
    should be equal     ${actual_code}        ${expected_code}

