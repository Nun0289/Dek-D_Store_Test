*** Settings ***
Library             SeleniumLibrary
Library             BuiltIn
Library             String

*** Variables ***
${url_Dekd_Store}       https://www.dekdstore.com/th
${input_search}         //body/nav[@id='header-top']/div[1]/div[1]/div[2]/form[1]/div[1]/input[1]
${search_value}         ปากกา
${search_btn}           //body/nav[@id='header-top']/div[1]/div[1]/div[2]/form[1]/div[1]/span[1]/button[1]


*** Keywords ***
Click Search Button
    [Arguments]                    ${btn}                   
    Element Should Be Visible      ${btn}
    Click Element                  ${btn}
    # Element Should Be Visible      ${search_btn}
    # Click Element                  ${search_btn} 

Input Value For Search
    [Arguments]                    ${xpath_search}          ${search_value}
    Element Should Be Visible      ${xpath_search}
    Input Text                     ${xpath_search}          ${search_value}


*** Test Cases ***
Show search details 
    [tags]                          success
    Open Browser                    about:blank             chrome
    Go to                           ${url_Dekd_Store}
    Input Value For Search          ${input_search}         ${search_value}
    Click Search Button             ${search_btn}