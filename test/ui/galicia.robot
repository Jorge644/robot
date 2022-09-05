*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

Library     SeleniumLibrary
Suite Setup  Setup chromedriver

*** Test Cases ***
Testing with Browser
    [Documentation]    Launching the browser and go to home galicia and click online banking button
    LaunchBrowser    ${URL_GALICIA}    ${CHROME_BROWSER}
    Click Element    locator=${ONLINE_BANKING_BUTTON}  
    Element Text Should Be    ${DNI_INPUT_PLACEHOLDER}    ${DNI_INPUT_EXPECTED_PLACEHOLDER}
    [Teardown]    LogOutandCloseBrowser


