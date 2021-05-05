*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String

*** Variables ***
${TEST NAME}                เพิ่มสินค้าลงตะกร้า
${DELETE TEST NAME}         ลบสินค้าออกจากตะกร้า
${url_Dekd_Store_Login}     https://www.dekdstore.com/th/login
${title_Dekd_Login}         เข้าสู่ระบบ - Dek-D's Store Official
${input_email}              //*[@id="email"]
${input_password}           //*[@id="password"]
${btn_login}                //*[@id="loginForm"]/button
${email_value}              pp_ben@hotmail.com
${password_value}           test123456789

${title_Dekd}               Dek-D's Store Official
${book}                     //*[@id="product-grid"]/li[1]/figure/a/img
${add_to_cart}              //*[@id="order-btn"]

${cart}                     //*[@id="shopping-cart-btn"]
${remove_cart}              //*[@id="shoppingCartModal"]/div/div/div[2]/ul[1]/li/a
${delete}                   //*[@class="swal2-confirm swal2-styled"]

*** Keywords ***
Verify DekD page
    [Arguments]        ${title}
    Title Should Be    ${title}

Click Button
    [Arguments]                  ${btn}
    Element Should Be Visible    ${btn}
    Click Element                ${btn}

Select Book
    [Arguments]                  ${ele}
    Element Should Be Visible    ${ele}
    Click Element                ${ele}

Add To Cart 
    [Arguments]                  ${ele}
    Element Should Be Visible    ${ele}
    Click Element                ${ele}

Remove From Cart
    [Arguments]                  ${ele}    ${ele_x}
    Element Should Be Visible    ${ele}
    Click Element                ${ele}
    Sleep                        1
    Element Should Be Visible    ${ele_x}
    Click Element                ${ele_x}

Input Information For Login
    [Arguments]                  ${xpath_email}        ${xpath_password}    ${email}    ${password}    
    Element Should Be Visible    ${xpath_email}
    Element Should Be Visible    ${xpath_password}
    Input Text                   ${xpath_email}        ${email}
    Input Text                   ${xpath_password}     ${password}

***Test Cases ***
เพิ่มสินค้าลงตะกร้า Dek-D's Store Official ด้วย Chrome
    Open Browser                     about:blank           chrome
    maximize browser window
    Go To                            ${url_Dekd_Store_Login}
    Verify DekD page                 ${title_Dekd_Login}
    Input Information For Login      ${input_email}        ${input_password}    ${email_value}    ${password_value}    
    Click Button                     ${btn_login}
    Verify DekD page                 ${title_DekD}
    execute javascript               window.scrollTo(0, 1400)
    Select Book                      ${book}
    Add To Cart                      ${add_to_cart}
    Sleep                            1
    Capture Page Screenshot          ${TEST NAME}.png

ลบสินค้าลงตะกร้า Dek-D's Store Official ด้วย Chrome
    Open Browser                     about:blank           chrome
    maximize browser window
    Go To                            ${url_Dekd_Store_Login}
    Verify DekD page                 ${title_Dekd_Login}
    Input Information For Login      ${input_email}        ${input_password}    ${email_value}    ${password_value}    
    Click Button                     ${btn_login}
    Verify DekD page                 ${title_DekD}
    Remove From Cart                 ${cart}               ${remove_cart}
    Click Button                     ${delete}
    Sleep                            1
    Capture Page Screenshot          ${DELETE TEST NAME}.png    
    