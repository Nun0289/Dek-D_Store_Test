*** Settings ***
Library             SeleniumLibrary
Library             BuiltIn
Library             String

*** Variables ***
${url_Dekd_Store_Login_Page}    https://www.dekdstore.com/th/login
${url_Dekd_Store_Edit_Profile}  https://www.dekdstore.com/th/customer
${input_username}               //input[@id='email']
${input_password}               //input[@id='password']
${input_facebook}               //body/div[2]/ul[2]/li[1]/div[1]/a[1]
${intput_username_facebook}     //input[@id='email']
${intput_password_facebook}     //input[@id='pass']
${btn_login_facebook}           //button[@id='loginbutton']      
${username_success}             61070017@it.kmitl.ac.th
${password_success}             61070017
${username_fail}                61070017@it.kmitl.ac.th
${password_fail}                61070018
${title_Dekd_Login}             เข้าสู่ระบบ - Dek-D's Store Official
${title_Dekd_Edit_Profile}      จัดการข้อมูลส่วนตัว - Dek-D's Store Official
${title_Dekd_Home}              Dek-D's Store Official
${title_Dekd_facebook}          เข้าสู่ระบบ Facebook | Facebook
${btn_login}                    //button[contains(text(),'เข้าสู่ระบบ')]

${P_firstname}                   //input[@name='firstname']
${P_lastname}                    //input[@name='lastname']
${P_email}                       //input[@name='email']
${P_phone}                       //input[@name='full_phone']
${P_idcard}                      //input[@name='idcard']
${P_birthday}                    //input[@name='birthday']
${btn_p_accept}                  //button[contains(text(),'บันทึก')]
${P_Input_Null}            
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

Input Information
    [Arguments]                  ${xpath_firstname}     ${input_firstname}
    Element Should Be Visible    ${xpath_firstname}
    Input Text                   ${xpath_firstname}     ${input_firstname}

Click Button Login
    [Arguments]                  ${btn}
    Element Should Be Visible    ${btn}
    Click Element                ${btn}    

Check Button Agreement
    [Arguments]                  ${btn}
    Element Should Be Visible    ${btn}
    Click Element                ${btn}

*** Test Cases ***
Edit Profile with Null Input- Fail
    [tags]                            success
    Open Browser                      about:blank               chrome
    Go To                             ${url_Dekd_Store_Login_Page}
    Verify DekD Login page            ${title_Dekd_Login}
    Input Information For Login       ${input_username}     ${input_password}       ${username_success}       ${password_success}
    Click Button Login                ${btn_login}
    Verify Dekd Home page             ${title_Dekd_Home}
    Go To                             ${url_Dekd_Store_Edit_Profile}
    Verify Dekd Home page             ${title_Dekd_Edit_Profile}
    Input Information                 ${P_firstname}             ${P_Input_Null}
    Input Information                 ${P_lastname}             ${P_Input_Null}
    # Input Information                 ${P_email}             ${P_Input_Null}
    # Input Information                 ${P_phone}             ${P_Input_Null}
    execute javascript               window.scrollTo(0, 1000)
    # Input Information                 ${P_idcard}             ${P_Input_Null}
    # Input Information                 ${P_birthday}             ${P_Input_Null}
    Check Button Agreement            ${btn_p_accept}
    Click Button Login                ${btn_p_accept}