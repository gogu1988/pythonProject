*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}      https://www.google.com/

*** Test Cases ***
ExtractLinks
    open browser    ${url}  ${browser}
    maximize browser window
    input text  xpath://input[@title='Search']  robotframework
    press keys  xpath://input[@title='Search']  RETURN
    ${AllLinksCount}=    get element count   xpath://br/../div
    log to console  ${AllLinksCount}

    FOR   ${i}  IN RANGE    1   ${AllLinksCount}+1
        ${linkText}=    get text    xpath:(//br/../div)[${i}]
        log to console  ${linkText}
        log file
    END

    close browser

*** Keywords ***

