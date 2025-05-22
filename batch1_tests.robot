*** Settings ***
Documentation        This file contains Batch 1 Test Cases (text-only). Code and Keywords defined separately.

Resource             ./resources/keywords.robot
Resource             ./resources/variables.robot



*** Test Cases ***
QA-001 - Validate Random Dog Image Endpoint
    Return Random Dog Image
    Validate 200 Response
    Confirm JPG Presence

QA-002 - Verify List of All Breeds
    Return List Of All Breeds
    Validate 200 Response
    Verify All Breeds Dictionary

QA-003 - Test Sub-Breeds of Bulldog
    Return Specific Breed List
    Validate 200 Response
    List Sub-Breed Inside Breeds

QA-004 - Get Random Image from Specific Breed (Hound)
    Return Specific Breed Image
    Validate 200 Response
    Confirm URL Contains Breed In Path

QA-005 - Get X Random Dog Images
    Return X Dogs Breeds Images
    Validate 200 Response
    Verify If X URLs' Images Are Listed