*** Settings ***
Library    ../ExternalKeywords/API_Request.py

*** Variables ***

*** Test Cases ***
Test case 1 request test API
    API Tester  https://reqres.in/api/users?page=2

*** Keywords ***
API Tester
    [Arguments]  ${URL}
    Make Api Request  ${URL}