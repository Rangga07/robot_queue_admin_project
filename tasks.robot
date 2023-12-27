*** Settings ***
Documentation       Playwright template.

Library             RPA.Browser.Selenium    auto_close=${False}
Library             RPA.HTTP


*** Tasks ***
Minimal task
    Open Browser    http://192.168.108.23:8099/    chrome    # starts in headless in Control Room
    Maximize Browser Window
