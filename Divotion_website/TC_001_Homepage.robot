*** Settings ***
Library    SeleniumLibrary
Library    ../ExternalKeywords/Locators.py
Resource    ../Resources/resources1.robot
Test Teardown    Close Browser Window

*** Variables ***
${Browser}    Chrome
${URL}    https://divotion.com/


*** Test Cases ***
Test case 1 loading homepage
    [Documentation]    First test for the Divotion website. Simply checks if homepage can be loaded and works.
    [Tags]    Smoke    Regression
    ${Header}=  Real Element Locator  HomePage.Header
    ${Footer}=  Real Element Locator    HomePage.Footer
    Start browser and Maximize    ${URL}    ${BROWSER}
    page should contain element    ${Header}
    page should contain element    ${Footer}

Test case 2 Divoted
    [Documentation]    test for page detailing Divotion employees
    [Tags]    Smoke    Regression
    Start browser and Maximize    ${URL}    ${BROWSER}
    click element    xpath://a[@href="/divoted"]
    page should contain element    xpath://header[@class="header header--notfixed"]
    page should contain element    xpath:(//article[@class="colleague"])[1]

Test case 3 Opening case page
    [Documentation]    test for page detailing different cases/projects
    [Tags]    Smoke    Regression
    Start browser and Maximize    ${URL}    ${BROWSER}
    click element    xpath://a[@href="/cases"]
    sleep    3 seconds
    page should contain element    xpath://header[@class="header header--notfixed"]
    Page Should Contain Element    xpath://a[contains(text(), "Read the case about Case of BMW Financial Services / Alphabet")]
    page should contain element    xpath://a[contains(text(), "Read the case about Platform voor slimme verlichting")]
    page should contain element    xpath://a[@class="blurred-image__link hidden-link prefetched"][position()=3]
    page should contain element    xpath://a[@class="blurred-image__link hidden-link prefetched"][position()=4]
    Test footer

    Execute Javascript  window.scrollTo(0,0);
    mouse over  xpath://a[@class="blurred-image__link hidden-link" and position()=1]
    sleep  2 seconds
    Log To Console    now clicking
    click element    xpath://a[@class="blurred-image__link hidden-link" and position()=1]
    page should contain element    xpath://header[@class="header header--notfixed"]
    page should contain    BMW Financial Services

Test case 4 Event page
    [Documentation]    test for page detailing on current and past Divotion events
    [Tags]    Smoke    Regression
    Start browser and Maximize    ${URL}    ${BROWSER}
    click element    xpath://a[@href="/events"]
    Page Should Contain Element    xpath://article[@class="event"][position()=1]
    Page Should Contain Element    xpath://article[@class="event"][position()=3]
    Page Should Contain Element    xpath://article[@class="event"][position()=5]
    Test footer

Test case 5 trainingen pagina
    [Documentation]    test for page detailing on current and past Divotion events
    [Tags]    Smoke    Regression
    Start browser and Maximize    ${URL}    ${BROWSER}
    click element    xpath://a[@href="/trainingen"]
    sleep  5 seconds
    Page Should Contain Element    xpath://b[contains(text(), "trainingen")]
    Page Should Contain Element    xpath://article[@class="training"][position()=1]
    Page Should Contain Element    xpath://article[@class="training"][position()=2]


Test case 6 werken bij pagina
    [Documentation]  test for page with vacancies
    [Tags]  smoke  regression
    Start browser and Maximize    ${URL}    ${BROWSER}
    click element    xpath://a[@href="/werken-bij"]
    Page Should Contain Element    xpath://span[contains(text(), "ruimte om jezelf")]


*** Keywords ***
Real Element Locator
    [Arguments]  ${JsonPath}
    Log To Console    element locator called
    ${Result}=  read_locators_from_json  ${JsonPath}
    Log To Console    results loaded from json file
    [Return]  ${Result}
