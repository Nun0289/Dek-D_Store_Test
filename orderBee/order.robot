*** Settings ***
Library         SeleniumLibrary
*** Variable ***
${url_DekD_Store_All_Products}               https://www.dekdstore.com/th/category/113001/all-product
${product_item}                              //body/section[@id='main']/div[@id='app']/div[@id='main-content']/ul[@id='product-grid']/li[3]

${title_product_detail}                      กว่าจะเป็น...หมอฟัน ฉบับอัพเดตปี 2561 - Dek-D's Store Official
${title_Address_Page}                        เพิ่มที่อยู่ใหม่ - Dek-D's Store Official

${add_to_cart_btn}                           //button[@id='order-btn']
${order_btn}                                  //a[@id='shopping-cart-modal-btn']

*** Keywords ***
Verify DekD page
    [Arguments]        ${title}
    Title Should Be    ${title}
Check Button Agreement
    [Arguments]                             ${item}
    Element Should Be Visible               ${item}
    # Click Element                           ${item}
Click Product item
    [Arguments]                             ${item}
    Element Should Be Visible               ${item}
    Click Element                           ${item}
Click Order Button
    [Arguments]                             ${btn}
    Element Should Be Visible               ${btn}
    Click Element                           ${btn}

*** Test Cases ***
Open Browser- success
    [tags]                                 success
    Open Browser                            about:blank                     chrome
    Go to                                   ${url_DekD_Store_All_Products}
    execute javascript                      window.scrollTo(0, 200)
    # Check Button Agreement                  ${product_item}
    Click Product item                      ${product_item}
    Verify DekD page                        ${title_product_detail}
    Check Button Agreement                  ${add_to_cart_btn}
    Click Order Button                      ${add_to_cart_btn}
    Verify DekD page                        ${title_Address_page}
    Check Button Agreement                  ${order_btn}
    Click Order Button                      ${order_btn}
