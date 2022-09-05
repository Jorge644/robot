*** Settings ***
Library    OperatingSystem
Library    ../../env/lib/site-packages/JSONLibrary/jsonlibrary.py

*** Variables ***
${start_wars_base_endpoint}    https://swapi.dev/api/
${people_endpoint}    people/


*** Keywords ***
Get data csv from resources
    [Arguments]    ${file_name}
    ${file}    Get File    ${RESOURCES_PATH}${file_name}
    [Return]    ${file}


Set data json for test
    [Arguments]    ${file_name}
    ${file_data}    Load Json From File    ${RESOURCES_PATH}${file_name} 
    Set Suite Variable    ${suite_data}    ${file_data}