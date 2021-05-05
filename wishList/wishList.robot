*** Settings ***
Library             SeleniumLibrary
Library             BuiltIn
Library             String
# Suite Teardown    Close Browser
*** Variable ***
${url_Dekd_Store_Login_Page}    https://www.dekdstore.com/th/login
${url_Dekd_Detail_Product}      https://www.dekdstore.com/th/product/634231/product-634231?category_id=119886
${title_login_page}             เข้าสู่ระบบ - Dek-D's Store Official
${title_home_page}              Dek-D's Store Official
${title_wishlist_page}          สินค้าที่ชอบ - Dek-D's Store Official
${input_email}                  //input[@id='email']
${input_password}               //input[@id='password']
${email_success}                champza699@hotmail.com
${password_success}             699champza
${btn_login}                    //button[@class='btn btn-primary btn-block btn-lg']
${view_product}                 //div[@class='swiper-slide swiper-slide-active']/figure[@class='grid item']/figcaption[@class='item-info']/h3
${open_menu}                    //li[@class='login-menu']/a
${btn_to_view_wishlist}         //li[@class='login-menu open']/ul[@class='dropdown-menu -right']/li[2]
${add_or_remove_wistlist}       //input[@id='addToWishlist']
${go_to_product_detail}         //a[@class='title-link']
***Keywords***
Verify DekD Login page
    [Arguments]        ${title}
    Title Should Be    ${title}
Verify DekD Home page
    [Arguments]        ${title}
    Title Should Be    ${title}
Verify DekD Wish List page
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
Add WishList
    [Arguments]      ${btn}
    Click Element    ${btn}
Remove WishList
    [Arguments]      ${btn}
    Click Element    ${btn}
Click Open Menu and Click to View Wish List
    [Arguments]                  ${btn}             ${btn_wishlist}    
    Element Should Be Visible    ${btn}
    Click Element                ${btn}
    Element Should Be Visible    ${btn_wishlist}
    Click Element                ${btn_wishlist}    
Go to Detail Product
    [Arguments]                  ${btn}
    Element Should Be Visible    ${btn}
    Click Element                ${btn} 
***Test Cases***
Add Wish List and View Wish List- success
    [tags]                                         success
    Open Browser                                   about:blank                     chrome
    Go To                                          ${url_Dekd_Store_Login_Page}
    Verify DekD Login page                         ${title_login_page}
    Input Information For Login                    ${input_email}                  ${input_password}          ${email_success}    ${password_success}
    Click Login Button                             ${btn_login}
    Verify DekD Home page                          ${title_home_page}
    Go To                                          ${url_Dekd_Detail_Product}
    Add WishList                                   ${add_or_removewistlist}
    Click Open Menu and Click to View Wish List    ${open_menu}                    ${btn_to_view_wishlist}
Remove Wish List and View Wish List- success
    [tags]                                         success
    Open Browser                                   about:blank                                       chrome
    Go To                                          ${url_Dekd_Store_Login_Page}
    Verify DekD Login page                         ${title_login_page}
    Input Information For Login                    ${input_email}                                    ${input_password}           ${email_success}    ${password_success}
    Click Login Button                             ${btn_login}
    Verify DekD Home page                          ${title_home_page}
    Go To                                          https://www.dekdstore.com/th/customer/wishlist
    Go to Detail Product                           //a[@class='title-link']
    Remove WishList                                ${add_or_remove_wistlist}
    Click Open Menu and Click to View Wish List    ${open_menu}                                      ${btn_to_view_wishlist} 

