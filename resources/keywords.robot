*** Settings ***
Documentation        This file contains the Keywords for this mini-project.
Library              RequestsLibrary
Library              Collections
Library              String

Resource             variables.robot



*** Keywords ***

### --- Batch 1 Keywords --- ###
Return Random Dog Image
    ${response}=    GET    ${BASE_URL}/${GET_RANIMAGE}
    Set Test Variable    ${response}
    Log    Random Dog Image Endpoint Response: ${response.json()}

Validate 200 Response
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    Status Code 200 Validated.

Confirm JPG Presence
    Should Contain    ${response.text}    .jpg
    Log    Presence of JPG Image Validated.

Return List of All Breeds
    ${response}=    GET    ${BASE_URL}/${GET_ALLBREEDS}
    Set Test Variable    ${response}

Verify All Breeds Dictionary
    ${all_breeds}=    Convert To Dictionary    ${response.json()}
    Should Not Be Empty    ${all_breeds['message']}
    Log    Dictionary ${all_breeds} has key "message".

Return Specific Breed List
    ${response}=    GET    ${BASE_URL}/${GET_SPECIFIC_BREED}
    Set Test Variable    ${response}
    Log    Specific Breed List: ${response.json()}

List Sub-Breed Inside Breeds
    ${all_specifics}=    Convert To Dictionary    ${response.json()}
    List Should Contain Sub List    ${all_specifics['message']}    ${LIST_BULLDOGS}
    Log    Sub-Breeds ${LIST_BULLDOGS} Present Inside Breed ${SPECIFIC_BREED}.

Return Specific Breed Image
    ${response}=    GET    ${BASE_URL}/${GET_BREED_IMAGE}
    Set Test Variable    ${response}
    Log    Image For Specific Breed: ${SPECIFIC_BREED_IMAGE}

Confirm URL Contains Breed In Path
    ${breed_image}=    Convert To Dictionary    ${response.json()}
    Should Contain    ${breed_image['message']}    ${SPECIFIC_BREED_IMAGE}
    Log    URL Path Contains: ${SPECIFIC_BREED_IMAGE}

Return X Dogs Breeds Images
    ${response}=    GET    ${BASE_URL}/${GET_QT_BREEDS_IMAGE}
    Set Test Variable    ${response}

Verify If X URLs' Images Are Listed
    ${x_breeds}=    Convert To Dictionary    ${response.json()}
    ${actual_count}=    Get Length    ${x_breeds['message']}
    Should Be Equal As Numbers    ${actual_count}    ${QUANTITY_BREEDS}
    Log    ${QUANTITY_BREEDS} Random Dog URL Images Listed From ${x_breeds}.