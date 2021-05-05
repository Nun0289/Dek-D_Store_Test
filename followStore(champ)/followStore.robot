*** Settings ***
Library             SeleniumLibrary
Library             BuiltIn
Library             String
# Suite Teardown    Close Browser
*** Variable ***
${url_Dekd_Store_Login_Page}    https://www.dekdstore.com/th/login
${title_login_page}             เข้าสู่ระบบ - Dek-D's Store Official
${input_email}                  //input[@id='email']
${input_password}               //input[@id='password']
${email_success}                champza699@hotmail.com
${password_success}             699champza
${btn_login}                    //button[@class='btn btn-primary btn-block btn-lg']
${btn_follow}                   //a[@class='btn btn-primary']
${open_menu}                    //li[@class='login-menu']/a
${btn_to_view_follow_store}     //li[@class='login-menu open']/ul[@class='dropdown-menu -right']/li[1]
***Keywords***
Verify DekD Login page
    [Arguments]        ${title}
    Title Should Be    ${title}
Input Information For Login
    [Arguments]                  ${xpath_email}       ${xpath_password}    ${email}    ${password}
    Element Should Be Visible    ${xpath_email}
    Element Should Be Visible    ${xpath_password}
    Input Text                   ${xpath_email}       ${email}
    Input Text                   ${xpath_password}    ${password}
Click Login Button
    [Arguments]                  ${btn}
    Element Should Be Visible    ${btn}
    Click Element                ${btn}
Click Button To Follow Store
    [Arguments]                  ${btn}
    Element Should Be Visible    ${btn}
    Click Element                ${btn}
Click Open Menu and Click to View Follow Store
    [Arguments]                  ${btn}                 ${btn_follow_store}    
    Element Should Be Visible    ${btn}
    Click Element                ${btn}
    Element Should Be Visible    ${btn_follow_store}
    Click Element                ${btn_follow_store}    
***Test Cases***
Follow Store - success
    [tags]                                            success
    Open Browser                                      about:blank                     chrome
    Go To                                             ${url_Dekd_Store_Login_Page}
    Verify DekD Login page                            ${title_login_page}
    Input Information For Login                       ${input_email}                  ${input_password}               ${email_success}    ${password_success}
    Click Login Button                                ${btn_login}
    Click Button To Follow Store                      ${btn_follow}
    Click Open Menu and Click to View Follow Store    ${open_menu}                    ${btn_to_view_follow_store} 