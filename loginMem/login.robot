*** Settings ***
Library             SeleniumLibrary
Library             BuiltIn
Library             String

*** Variables ***
${url_Dekd_Store_Login_Page}    https://www.dekdstore.com/th/login
${input_username}               //input[@id='email']
${input_password}               //input[@id='password']
${input_facebook}               //body/section[@id='main']/div[@id='app']/div[@id='main-content']/div[1]/div[1]/a[1]
# ${input_facebook}               //body/div[2]/ul[2]/li[1]/div[1]/a[1]
${intput_username_facebook}     //input[@id='email']
${intput_password_facebook}     //input[@id='pass']
${btn_login_facebook}           //button[@id='loginbutton']      
${username_success}             61070017@it.kmitl.ac.th
${password_success}             61070017
${username_fail}                61070017@it.kmitl.ac.th
${password_fail}                61070018
${title_Dekd_Login}             เข้าสู่ระบบ - Dek-D's Store Official
${title_Dekd_Home}              Dek-D's Store Official
${title_Dekd_facebook}          เข้าสู่ระบบ Facebook | Facebook
${btn_login}                    //button[contains(text(),'เข้าสู่ระบบ')]
*** Keywords ***
Verify DekD Login page
    [Arguments]        ${title}
    Title Should Be    ${title}

Verify DekD Home page
    [Arguments]        ${title}
    Title Should Be    ${title}

Input Information For Login
    [Arguments]                  ${xpath_username}    ${xpath_password}     ${username}     ${password}
    Element Should Be Visible    ${xpath_username}
    Element Should Be Visible    ${xpath_password}
    Input Text                   ${xpath_username}    ${username}
    Input Text                   ${xpath_password}     ${password}

Click Button Login
    [Arguments]                  ${btn}
    Element Should Be Visible    ${btn}
    Click Element                ${btn}    

Click Facebook Login
    [Arguments]                  ${btn}
    Element Should Be Visible    ${btn}
    Click Element                ${btn} 

Click 
*** Test Cases ***
Login DekD Store- Success
    [tags]                            success
    Open Browser                      about:blank               chrome
    Go To                             ${url_Dekd_Store_Login_Page}
    Verify DekD Login page          ${title_Dekd_Login}
    Input Information For Login    ${input_username}     ${input_password}       ${username_success}       ${password_success}
    Click Button Login                ${btn_login}
    Verify Dekd Home page             ${title_Dekd_Home}

Login DekD Store- Fail
    [tags]                            success
    Open Browser                      about:blank               chrome
    Go To                             ${url_Dekd_Store_Login_Page}
    Verify DekD Login page         ${title_Dekd_Login}
    Input Information For Login    ${input_username}     ${input_password}       ${username_fail}       ${password_fail}
    Click Button Login                ${btn_login}
    Verify Dekd Home page             ${title_Dekd_Home}

Facebook Login Dekd Store- Fail
    [tags]                            success
    Open Browser                      about:blank               chrome
    Go To                             ${url_Dekd_Store_Login_Page}
    Verify DekD Login page         ${title_Dekd_Login}
    Click Facebook Login             ${input_facebook}
    Verify DekD Login page         ${title_Dekd_facebook}
    Input Information For Login    ${intput_username_facebook}     ${intput_password_facebook}       ${username_fail}       ${password_fail}
    Click Button Login                ${btn_login_facebook}
    Verify Dekd Home page             ${title_Dekd_Home}