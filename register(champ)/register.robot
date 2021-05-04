*** Settings ***
Library             SeleniumLibrary
Library             BuiltIn
Library             String
# Suite Teardown    Close Browser
*** Variable ***
${url_Dekd_Store_Page}    https://www.dekdstore.com/th/register
${title_Dekd}             สร้างบัญชีสมาชิก / BentoWeb - Dek-D's Store Official
${input_firstname}        //*[@id="firstname"]
${input_lastname}         //*[@id="lastname"]
${input_email}            //*[@id="email"]
${input_cemail}           //*[@id="cemail"]
${input_password}         //*[@id="password"]
${input_cpassword}        //*[@id="cpassword"]
${btn_agreement}          //*[@for="privacyPolicy"]
${btn_register}           //*[@id="submitBtn"]
${firstname_success}      Thanawat
${lastname_success}       Phutchip
${email_success}          champza699@hotmail.com
${cemail_success}         champza699@hotmail.com
${password_success}       699champza
${cpassword_success}      699champza
***Keywords***
Verify DekD Register page
    [Arguments]        ${title}
    Title Should Be    ${title}
Check Button Agreement
    [Arguments]                  ${btn}
    Element Should Be Visible    ${btn}
    Click Element                ${btn}
Click Button Register
    [Arguments]                  ${btn}
    Element Should Be Visible    ${btn}
    Click Element                ${btn}    
Input Information For Register
    [Arguments]                  ${xpath_firstname}    ${xpath_lastname}    ${xpath_email}    ${xpath_cemail}    ${xpath_password}    ${xpath_cpassword}    ${firstname}    ${lastname}    ${email}    ${cemail}    ${password}    ${cpassword}
    Element Should Be Visible    ${xpath_firstname}
    Element Should Be Visible    ${xpath_lastname}
    Element Should Be Visible    ${xpath_email}
    Element Should Be Visible    ${xpath_cemail}
    Element Should Be Visible    ${xpath_password}
    Element Should Be Visible    ${xpath_cpassword}
    Input Text                   ${xpath_firstname}    ${firstname}
    Input Text                   ${xpath_lastname}     ${lastname}
    Input Text                   ${xpath_email}        ${email}
    Input Text                   ${xpath_cemail}       ${cemail}
    Input Text                   ${xpath_password}     ${password}
    Input Text                   ${xpath_cpassword}    ${cpassword}
Verify Register Fail
    [Arguments]                  ${xpath_firstname}    ${xpath_lastname}    ${xpath_email}    ${xpath_cemail}    ${xpath_password}    ${xpath_cpassword}    
    Element Should Be Visible    ${xpath_firstname}
    Element Should Be Visible    ${xpath_lastname}
    Element Should Be Visible    ${xpath_email}
    Element Should Be Visible    ${xpath_cemail}
    Element Should Be Visible    ${xpath_password}
    Element Should Be Visible    ${xpath_cpassword}
***Test Cases***
Register DekD Store
    [tags]                            success
    Open Browser                      about:blank               chrome
    Go To                             ${url_Dekd_Store_Page}
    Verify DekD Register page         ${title_Dekd}
    Input Information For Register    ${input_firstname}        ${input_lastname}    ${input_email}    ${input_cemail}    ${input_password}    ${input_cpassword}    ${firstname_success}    ${lastname_success}    ${email_success}    ${cemail_success}    ${password_success}    ${cpassword_success}
    Check Button Agreement            ${btn_agreement}
    Click Button Register             ${btn_register}


