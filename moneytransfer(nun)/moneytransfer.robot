*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String

*** Variables ***
${TEST NAME}                แสดงเเจ้งการโอนเงิน
${url_Dekd_Store_Login}     https://www.dekdstore.com/th/login
${title_Dekd_Login}         เข้าสู่ระบบ - Dek-D's Store Official
${input_email}              //*[@id="email"]
${input_password}           //*[@id="password"]
${btn_login}                //*[@id="loginForm"]/button
${email_value}              pp_ben@hotmail.com
${password_value}           test123456789

${title_Dekd}               Dek-D's Store Official
${head}                     //*[@id="header-top"]/div/div/div[3]/ul/li[3]/a
${point}                    //*[@id="header-top"]/div/div/div[3]/ul/li[3]/ul/li[2]/a

*** Keywords ***
Verify DekD page
    [Arguments]        ${title}
    Title Should Be    ${title}

Click Button
    [Arguments]                  ${btn}
    Element Should Be Visible    ${btn}
    Click Element                ${btn}

Show point
    [Arguments]                  ${btn}    ${btn_point}
    Element Should Be Visible    ${btn}
    Click Element                ${btn}
    Element Should Be Visible    ${btn_point}
    Click Element                ${btn_point}

Input Information For Login
    [Arguments]                  ${xpath_email}        ${xpath_password}    ${email}    ${password}    
    Element Should Be Visible    ${xpath_email}
    Element Should Be Visible    ${xpath_password}
    Input Text                   ${xpath_email}        ${email}
    Input Text                   ${xpath_password}     ${password}

***Test Cases ***
แสดงเเจ้งการโอนเงิน Dek-D's Store Official ด้วย Chrome
    Open Browser                     about:blank           chrome
    maximize browser window
    Go To                            ${url_Dekd_Store_Login}
    Verify DekD page                 ${title_Dekd_Login}
    Input Information For Login      ${input_email}        ${input_password}    ${email_value}    ${password_value}    
    Click Button                     ${btn_login}
    Verify DekD page                 ${title_DekD}
    Show point                       ${head}               ${point}
    Sleep                            1
    Capture Page Screenshot          ${TEST NAME}.png


