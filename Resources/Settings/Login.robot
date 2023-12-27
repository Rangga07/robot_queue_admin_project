*** Settings ***
Library         RPA.Browser.Selenium    auto_close=${False}
Variables       ${CURDIR}/../../Config/Environment.py


*** Keywords ***
Before
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Login Single Queue Success
    Wait Until Element Is Visible    //input
    Input Text    xpath=//input    yopi@caredokter.com
    Input Text    xpath=(//input)[2]    Qwerty123
    Click Element    xpath=//span[@class="content"]
    Sleep    2
