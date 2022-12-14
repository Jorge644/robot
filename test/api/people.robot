*** Settings ***
Library    RequestsLibrary
Library    ../../env/lib/site-packages/robot/libraries/OperatingSystem.py
Library    ../../env/lib/site-packages/robot/libraries/String.py
Library    ../../env/lib/site-packages/robot/libraries/Collections.py
Library    ../../env/lib/site-packages/JSONLibrary/JSONLibrary.py
Resource   resources.robot


*** Variables ***
${people1}    1
${people2}    2
${people3}    3
${expected_name1}    Luke Skywalker
${expected_name2}    C-3PO
${expected_name3}    R2-D2
${people_data_file}    people_data.json


*** Test Cases ***
Testing the people star wars API
    ${file_data}    Load Json From File    file_name=${RESOURCES_PATH}${people_data_file}
    FOR    ${element}    IN    @{file_data}
        ${people_id}    Get From Dictionary   ${element}    people_id
        ${expected_name}    Get From Dictionary    ${element}    expected_name
        Get api people star wars given a ${people_id} validate ${expected_name}
    END

Testing templates
    [Template]   Get api people star wars given a ${people_id} validate ${expected_name}
    [Documentation]    Get api people star wars given a ${people_id} then validate ${expected_name}
    [Tags]    api
    ${people1}    ${expected_name1}
    ${people2}    ${expected_name2}
    ${people3}    ${expected_name3}

*** Keywords ***
Get api people star wars given a ${people_id} validate ${expected_name}
    ${response} =    GET    ${start_wars_base_endpoint}${people_endpoint}${people_id}    expected_status=200
    ${actual_name}    Set Variable    ${response.json()['name']}
    Should Be Equal    ${actual_name}    ${expected_name}    
    Validate Json By Schema File    ${response.json()}    ${RESOURCES_PATH}people_schema_validator.json


