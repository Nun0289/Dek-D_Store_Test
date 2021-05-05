*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String

*** Variables ***
${TEST NAME}                เพิ่มที่อยู่การจัดส่ง
${EDIT TEST NAME}           แก้ไขที่อยู่การจัดส่ง
${DELETE TEST NAME}         ลบที่อยู่การจัดส่ง
${url_Dekd_Store_Login}     https://www.dekdstore.com/th/login
${title_Dekd_Login}         เข้าสู่ระบบ - Dek-D's Store Official
${input_email}              //*[@id="email"]
${input_password}           //*[@id="password"]
${btn_login}                //*[@id="loginForm"]/button
${email_value}              pp_ben@hotmail.com
${password_value}           test123456789

${title_Dekd}               Dek-D's Store Official
${btn_profile}              //*[@id="header-top"]/div/div/div[3]/ul/li[2]/a
${btn_edit_address}         //*[@id="header-top"]/div/div/div[3]/ul/li[2]/ul/li[4]/a
${title_Dekd_edit}          จัดการที่อยู่สำหรับการจัดส่ง - Dek-D's Store Official
${btn_edit}                 //*[@id="main-content"]/div[2]/ul/li/div/a
${title_DekD_addAdd}        เพิ่มที่อยู่ใหม่ - Dek-D's Store Official

${input_firstname}          //*[@id="customerAddressForm"]/div[2]/div/div[2]/div/input
${input_lastname}           //*[@id="customerAddressForm"]/div[2]/div/div[3]/div/input
${input_aemail}             //*[@id="customerAddressForm"]/div[2]/div/div[4]/div/input
${input_phone}              //*[@id="customerAddressForm"]/div[2]/div/div[5]/div/div/input[2]
${input_post}               //*[@id="st-search"]
${input_add1}               //*[@id="customerAddressForm"]/div[2]/div/div[8]/div/input
${input_add2}               //*[@id="customerAddressForm"]/div[2]/div/div[9]/div/input
${btn_add_address}          //*[@id="customerAddressForm"]/div[3]/div/div[1]/button

${firstname_value}          พิทยา
${lastname_value}           ดีวิพุธ
${aemail_value}             pp_ben@hotmail.com
${phone_value}              0874744390
${post_value}               บางขุนศรี, บางกอกน้อย, กรุงเทพมหานคร, 10700
${add1_value}               473/26
${add2_value}               จรัญ35 ถนนจรัญสนิทวงศ์

${title_edit_page}          แก้ไขที่อยู่ - Dek-D's Store Official
${delete}                   //*[@class="swal2-confirm swal2-styled"]

*** Keywords ***
Verify DekD page
    [Arguments]        ${title}
    Title Should Be    ${title}

Click Button
    [Arguments]                  ${btn}
    Element Should Be Visible    ${btn}
    Click Element                ${btn}

Click To Add Address
    [Arguments]                  ${btn}
    Element Should Be Visible    ${btn}
    Click Element                ${btn}

Input Information For Login
    [Arguments]                  ${xpath_email}        ${xpath_password}    ${email}    ${password}    
    Element Should Be Visible    ${xpath_email}
    Element Should Be Visible    ${xpath_password}
    Input Text                   ${xpath_email}        ${email}
    Input Text                   ${xpath_password}     ${password}

Input Information For Address
    [Arguments]                  ${xpath_firstname}    ${xpath_lastname}    ${xpath_email}    ${xpath_phone}    ${xpath_post}    ${xpath_add1}    ${xpath_add2}    ${firstname}    ${lastname}    ${email}    ${phone}    ${post}    ${add1}    ${add2}
    Element Should Be Visible    ${xpath_firstname}
    Element Should Be Visible    ${xpath_lastname}
    Element Should Be Visible    ${xpath_email}
    Element Should Be Visible    ${xpath_phone}
    Element Should Be Visible    ${xpath_add1}
    Element Should Be Visible    ${xpath_add2}
    Element Should Be Visible    ${xpath_post}
    Input Text                   ${xpath_firstname}    ${firstname}
    Input Text                   ${xpath_lastname}     ${lastname}
    Input Text                   ${xpath_email}        ${email}
    Input Text                   ${xpath_phone}        ${phone}
    Input Text                   ${xpath_post}         ${post}
    Sleep                        1
    Click Element                //*[@id="thailand-block"]/div/div/span[1]/div
    Input Text                   ${xpath_add1}         ${add1}
    Input Text                   ${xpath_add2}         ${add2}
    

***Test Cases ***
เพิ่มที่อยู่การจัดส่ง Dek-D's Store Official ด้วย Chrome
    Open Browser                     about:blank           chrome
    maximize browser window
    Go To                            ${url_Dekd_Store_Login}
    Verify DekD page                 ${title_Dekd_Login}
    Input Information For Login      ${input_email}        ${input_password}    ${email_value}    ${password_value}    
    Click Button                     ${btn_login}
    Verify DekD page                 ${title_DekD}
    Click Button                     ${btn_profile}
    Click Button                     ${btn_edit_address}
    Verify DekD page                 ${title_Dekd_edit}
    Click Button                     ${btn_edit}
    Verify DekD page                 ${title_DekD_addAdd}
    Sleep                            1
    Input Information For Address    ${input_firstname}    ${input_lastname}    ${input_aemail}    ${input_phone}    ${input_post}    ${input_add1}    ${input_add2}    ${firstname_value}    ${lastname_value}    ${aemail_value}    ${phone_value}    ${post_value}    ${add1_value}    ${add2_value}
    Click To Add Address             ${btn_add_address}
    Sleep                            1
    Capture Page Screenshot          ${TEST NAME}.png

แก้ไขที่อยู่การจัดส่ง Dek-D's Store Official ด้วย Chrome
    Open Browser                     about:blank           chrome
    maximize browser window
    Go To                            ${url_Dekd_Store_Login}
    Verify DekD page                 ${title_Dekd_Login}
    Input Information For Login      ${input_email}        ${input_password}    ${email_value}    ${password_value}    
    Click Button                     ${btn_login}
    Verify DekD page                 ${title_DekD}
    Click Button                     ${btn_profile}
    Click Button                     ${btn_edit_address}
    Verify DekD page                 ${title_Dekd_edit}
    Click Button                     //*[@id="main-content"]/div[2]/ul/li[1]/div/ul/li[1]/a
    Verify DekD page                 ${title_edit_page}
    Sleep                            1
    execute javascript               window.scrollTo(0, 1000)
    Click Button                     //*[@id="customerAddressForm"]/div[3]/div/div[1]/button
    Sleep                            2
    Capture Page Screenshot          ${EDIT TEST NAME}.png

ลบที่อยู่การจัดส่ง Dek-D's Store Official ด้วย Chrome
    Open Browser                     about:blank           chrome
    maximize browser window
    Go To                            ${url_Dekd_Store_Login}
    Verify DekD page                 ${title_Dekd_Login}
    Input Information For Login      ${input_email}        ${input_password}    ${email_value}    ${password_value}    
    Click Button                     ${btn_login}
    Verify DekD page                 ${title_DekD}
    Click Button                     ${btn_profile}
    Click Button                     ${btn_edit_address}
    Verify DekD page                 ${title_Dekd_edit}
    Click Button                     //*[@id="main-content"]/div[2]/ul/li[1]/div/ul/li[2]/a
    Click Button                     ${delete}
    Sleep                            1
    Capture Page Screenshot          ${DELETE TEST NAME}.png