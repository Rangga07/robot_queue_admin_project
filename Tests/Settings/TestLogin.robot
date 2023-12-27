*** Settings ***
Documentation       Automation test fitur Login

Library             RPA.Browser.Selenium    auto_close=${False}
Resource            ${CURDIR}/../../Resources/Settings/Login.robot

Suite Setup         Before


*** Test Cases ***
Login Single Queue
    [Tags]    login    positive
    Login Single Queue Success
