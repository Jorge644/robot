*** Settings ***
Library    OperatingSystem

*** Variables ***
${start_wars_base_endpoint}    https://swapi.dev/api/
${people_endpoint}    people/


*** Keywords ***
Get data csv from resources
    [Arguments]    ${file_name}
    ${file}    Get File    ${RESOURCES_PATH}${file_name}
    [Return]    ${file}