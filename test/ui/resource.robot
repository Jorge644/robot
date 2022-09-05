*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library  OperatingSystem
Resource    ${EXECDIR}\\test\\basic_keywords.robot

*** variables ***
${ONLINE_BANKING_BUTTON }    xpath=//a[contains(text(), 'Online Banking')]
${DNI_INPUT_PLACEHOLDER}    xpath=//input[@id='DocumentNumber']/parent::div/following-sibling::label
${DNI_INPUT_EXPECTED_PLACEHOLDER}    Tu DNI


*** Keywords ***
LaunchBrowser
    [Arguments]   ${appURL}    ${appBrowser}
    Go To    ${URL_GALICIA}
    Maximize Browser Window
    ${Pgtitle}=  Get Title
    Log     ${Pgtitle}    WARN

LogOutandCloseBrowser
    Close Browser


Setup chromedriver
    Create Webdriver     Chrome     executable_path=${CHROME_DRIVER_PATH}
    Set Selenium Implicit Wait    value=${IMPLICIT_WAIT}
    
    
