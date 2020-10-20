*** Settings ***
Documentation  This is a Resource file
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  chrome
${LOGIN URL}  https://demo.nopcommerce.com/

*** Keywords ***
Open my Browser
    open browser    ${LOGIN URL}    ${BROWSER}
    log   <a href="http://localhost:63342/Training/TestData/WebappData.xlsx">Input Data File<a>    html=True

Set Implicit Time
    set selenium implicit wait  15 seconds

Close browsers
    close all browsers

Go to Loginpage
    click link  class:ico-login
    sleep   2

Input Email
    [Arguments]    ${email}
    input text  id:Email    ${email}

Input Password
    [Arguments]  ${password}
    input text  id:Password     ${password}

Log in
    click element   xpath://input[@class="button-1 login-button"]
    sleep   2

Page title check
    title should be     nopCommerce demo store

Search Item
    [Arguments]  ${category}    ${item}
    mouse over  link:${category}
    set selenium timeout    15 seconds
    wait until page contains    ${item}
    mouse over  link:${item}
    click link  link:${item}
    title should be     nopCommerce demo store. ${item}

Place Filters
    select from list by index   products-orderby    4
    sleep   2
    select from list by label   products-orderby    Name: A to Z
    sleep   2
    select from list by index   products-pagesize   0

Going to cart
    click link  xpath://*[@id="topcartlink"]/a
    title should be     nopCommerce demo store. Shopping Cart
    sleep   2

Log out
    click link  class:ico-logout
    sleep   2
    title should be     nopCommerce demo store

Error message should be visible
    page should contain    Login was unsuccessful

Scrolling in Page
    #end of page
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    sleep   2
    #starting of page
    execute javascript  window.scrollTo(0,-document.body.scrollHeight)
    sleep   2

Register
    [Arguments]    ${email}      ${password}    ${first}    ${last}     ${day}   ${month}    ${year}
    click element   xpath://input[@class="button-1 register-button"]
    click element   id:gender-female
    #set selenium speed  1 seconds
    input text  id:FirstName    ${first}
    input text  id:LastName     ${last}
    select from list by label   DateOfBirthDay    ${day}
    select from list by label   DateOfBirthMonth    ${month}
    select from list by label   DateOfBirthYear     ${year}
    input text  id:Email    ${email}
    click element   id:Newsletter
    input text  id:Password     ${password}
    input text  id:ConfirmPassword     ${password}
    set selenium speed  0 seconds
    click element    id:register-button
    page should contain   Your registration completed
    click element   name:register-continue









