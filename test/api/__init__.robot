*** Settings ***
Suite Setup       Set environment for execution
Library    OperatingSystem   
Library    ../../env/lib/site-packages/robot/libraries/Collections.py
Library    RequestsLibrary


*** Variables ***
${error_environment_message}    Could initialize resources environment, set environment.json file

*** Keywords ***
Set environment for execution 

    ${file}    Get File    ${EXECDIR}\\resources\\environment.json  
    ${env}    To Json    ${file}
    ${env}    Get From Dictionary    ${env}    environment

    Run Keyword If    '${env}'=='development'    Set environment helper    dev
    Run Keyword If    '${env}'=='preproduccion'    Set environment helper    pre
    ${is_environment_settled}   Get Variable Value    ${RESOURCES_PATH}
    Should Not Be Equal    ${is_environment_settled}    ${None}    msg=${error_environment_message}


Set environment helper
    [Arguments]    ${environment}
    Set Global Variable    ${RESOURCES_PATH}    ${EXECDIR}\\resources\\env\\${environment}\\

