*** Settings ***
Documentation  This is a Hybrid test case which involves usage of both UI and API
Library  SeleniumLibrary
Library  RequestsLibrary

*** Variables ***
${base_url}     https://api.github.com
${BROWSER}  chrome
${LOGIN URL}  https://github.com/HariniYadav
${expected_code}    200

*** Test Cases ***
HybridTest
    Comparing both values of Location

*** Keywords ***
Comparing both values of Location
#   Getting Location from URL
    open browser    ${LOGIN URL}  ${browser}
    maximize browser window
    title should be     HariniYadav · GitHub
    click element   class:UnderlineNav-item
    ${location_in_UI}=    get text   xpath://*[@id="js-pjax-container"]/div[2]/div/div[1]/div/div[4]/div[2]/ul/li[1]/span
    log to console      ${location_in_UI}
    close browser

#   Getting Location from API
    create session      mysession     ${base_url}
    ${response}=    get request     mysession    users/HariniYadav
    ${actual_code}      convert To string     ${response.status_code}
    should be equal     ${actual_code}        ${expected_code}
    ${body}=     convert to string  ${response.content}
    ${json} =  set variable  ${response.json()}
    ${location_in_API}=     set variable    ${json["location"]}
    log to console     ${location_in_API}

#   Comparing both values of Location
    should be equal     ${location_in_UI}   ${location_in_API}
    log     Test is Successful



