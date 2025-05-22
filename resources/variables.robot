*** Settings ***
Documentation        This file contains the Variables for this mini-project.
Library              Collections

Resource             keywords.robot



*** Variables ***
${BASE_URL}                 https://dog.ceo/api


### --- Endpoints --- ###
${GET_RANIMAGE}             breeds/image/random
${GET_ALLBREEDS}            breeds/list/all

## List Sub-Breeds From Specific Breed ##
${SPECIFIC_BREED}           bulldog
@{LIST_BULLDOGS}            boston    english    french
${GET_SPECIFIC_BREED}       breed/${SPECIFIC_BREED}/list

## List Images From Specific Breed ##
${SPECIFIC_BREED_IMAGE}     hound
${GET_BREED_IMAGE}          breed/${SPECIFIC_BREED_IMAGE}/images/random

## List x Dogs Breeds Image ##
${QUANTITY_BREEDS}          3
${GET_QT_BREEDS_IMAGE}      breeds/image/random/${QUANTITY_BREEDS}