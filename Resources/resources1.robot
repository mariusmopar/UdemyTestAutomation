*** Settings ***
Library    SeleniumLibrary
Library    ../ExternalKeywords/UserKeywords.py

*** Variables ***


*** Keywords ***
Start browser and Maximize
    [Arguments]    ${URL}    ${Browser}
    open browser    ${URL}    ${Browser}
    maximize browser window
    page should contain element    xpath://header[@class="header header--notfixed"]

Test footer
    Execute Javascript  window.scrollTo(0,document.body.scrollHeight);
    sleep  3 seconds
    Wait Until Element Is Visible    xpath://div[@class='footer-container']
    Page Should Contain Element    xpath://div[@class='footer__about']
    Page Should Contain Element    xpath://div[@class="footer__navigation"]
    Page Should Contain Element    xpath://div[@class="footer__contact"]

Close Browser Window
    sleep    2 seconds
    close all browsers



