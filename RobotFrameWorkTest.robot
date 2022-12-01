*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    Resources/resources1.robot

*** Variables ***
${Browser}    Chrome
${URL1}    http://www.thetestingworld.com/testings
${URL2}    https://robotframework.org/
${Password}    verycoolPass



*** Test Cases ***
TC_001 Browser start and close
    [Setup]    log to console    setup should now happen
    [Teardown]    log to console    teardown should now happen
    # open browser open URL and switch between windows
    [Documentation]    This test is a general overview and practice of all learned concepts
    Start browser and Maximize    ${URL1}    Chrome
    sleep    3 seconds
    Open Browser    ${URL2}    Chrome    alias=second
    maximize browser window
    switch browser    1
    ${URLVAR1}=    get location
    switch browser    second    # alias
    ${URLVAR2}=    get location
    log to console    ${URLVAR1}
    log to console    ${URLVAR2}
    switch browser    1

    sleep    3 seconds

    # Switch between tabs, to do this use the title of the web page (can be found in the XML, search for title)
    switch window     Login & Sign Up Forms


    # creating a list
    @{List1}    create list    item1    item2    item3    item4    ${Browser}    ${URL1}

    # conditions
    ${Var}=    set variable    NO
    run keyword if    '${Var}'=='YES'    log to console    value found
    run keyword if    '${Var}'=='NO'    log to console    value not found

    # interaction
    input text    xpath://input[@name="fld_username"]    cool username
    input text    xpath://input[@name="fld_email"]    verycool@email.com
    input text    xpath://input[@name="fld_password"]    ${password}
    input text    xpath://input[@name="fld_cpassword"]    ${password}

    # selenium speed
    set selenium speed    5 seconds
    ${speed}=    get selenium speed
    log to console    ${speed}

    # Screenshots
    # Giving no directory will create screenshots in the same file location as the logs
    set screenshot directory    C:/Users/mariu/PycharmProjects/setupProject/screenshots
    capture page screenshot    screenshot1.png
    log to console    screenshot taken

    # selenium timeout
    wait until page contains    Testing
    set selenium timeout    2 seconds
    ${timeout time}=    get selenium timeout
    log to console    Time out is ${timeout time}

    # selenium implicit wait
    # difference between time out and implicit wait is the following:
    # explicit wait is telling the software to wait for a certain condition, for example, wait untill ... is element should be visible
    # implicit wait is telling the software to wait n seconds before throwing an exception when trying to locate an element,
    # giving the website more time to reload library.
    # time out is the inherent variable a lot of keywords use, for example wait untill... therefore it is closely related to explicit wait keywords.
    set selenium implicit wait    2 seconds

    # run javascript at runtime, usefull for example executing actions within the browser not the website
    execute javascript    window.scrollTo(0,1000)
    sleep    2 seconds

    # mouse actions
    open context menu    xpath://input[@name="fld_email"]
    double click element    xpath://input[@name="fld_email"]
    mouse down    xpath://input[@name="fld_email"]
    mouse up    xpath://input[@name="fld_email"]
    # very useful for dropdowns
    mouse over    xpath://input[@name="fld_email"]

    # keyboard actions
    press keys    xpath://input[@name="fld_email"]    typed out input
    # to use ASCII characters use double backslash
    press keys    xpath://input[@name="fld_email"]    \\13

    switch browser    2
    click element    xpath://a[@href="https://github.com/robotframework/robotframework.github.com/issues"]
    sleep    2 seconds
    switch browser    1

    page should not contain    hyves

    page should contain button    class:col-sm-1 type-right flex center middle
    close all browsers

*** Keywords ***
