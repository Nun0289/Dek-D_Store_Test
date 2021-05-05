*** Settings ***
Library             SeleniumLibrary
Library             BuiltIn
Library             String

*** Variables ***
${url_Dekd_Store}              https://www.dekdstore.com/th

${all_product_btn}             //a[contains(text(),'สินค้าทั้งหมด')]
${hot_product_btn}             //a[contains(text(),'Hot')]
${new_product_btn}             //a[contains(text(),'New')]
${popular_product_btn}         //a[contains(text(),'สินค้าขายดี')]

${btn_view_all_product}            //body/section[@id='main']/div[@id='app']/div[@id='main-content']/ul[@id='product-grid']/li[1]/figure[1]
${btn_view_hot_product}            //body/section[@id='main']/div[@id='app']/div[@id='main-content']/ul[@id='product-grid']/li[3]
${btn_view_new_product}            //body/section[@id='main']/div[@id='app']/div[@id='main-content']/ul[@id='product-grid']/li[4]
${btn_view_popular_product}        //body/section[@id='main']/div[@id='app']/div[@id='main-content']/ul[@id='product-grid']/li[1]/figure[1]

*** Keywords ***
Click All Product Button
    [Arguments]                    ${btn}                   
    Element Should Be Visible      ${btn}
    Click Element                  ${btn}
    Element Should Be Visible      ${all_product_btn}
    Click Element                  ${all_product_btn} 
Click Goods In All Product To View
    [Arguments]                    ${btn}
    Element Should Be Visible      ${btn}
    Click Element                  ${btn}

Click Hot Product Button
    [Arguments]                    ${btn}                     
    Element Should Be Visible      ${btn}
    Click Element                  ${btn}
Click Goods In Hot Product To View
    [Arguments]                    ${btn}
    Element Should Be Visible      ${btn}
    Click Element                  ${btn}

Click New Product Button
    [Arguments]                    ${btn}                     
    Element Should Be Visible      ${btn}
    Click Element                  ${btn}
Click Goods In New Product To View
    [Arguments]                    ${btn}
    Element Should Be Visible      ${btn}
    Click Element                  ${btn}

Click Popular Product Button
    [Arguments]                    ${btn}                      
    Element Should Be Visible      ${btn}
    Click Element                  ${btn}
Click Goods In Popular Product To View
    [Arguments]                    ${btn}
    Element Should Be Visible      ${btn}
    Click Element                  ${btn}

*** Test Cases ***
View All Product
    [tags]                                          success
    Open Browser                                    about:blank             chrome
    Go to                                           ${url_Dekd_Store}
    execute javascript                              window.scrollTo(0, 1100)
    Click Goods In All Product To View              ${btn_view_all_product}
View Hot Product
    [tags]                                          success
    Open Browser                                    about:blank             chrome
    Go to                                           ${url_Dekd_Store}
    execute javascript                              window.scrollTo(0, 1100)
    Click Hot Product Button                        ${hot_product_btn}
    Click Goods In Hot Product To View              ${btn_view_hot_product}
View New Product
    [tags]                                          success
    Open Browser                                    about:blank             chrome
    Go to                                           ${url_Dekd_Store}
    execute javascript                              window.scrollTo(0, 1100)
    Click New Product Button                        ${new_product_btn}
    Click Goods In New Product To View              ${btn_view_new_product}
View Popular Product
    [tags]                                          success
    Open Browser                                    about:blank             chrome
    Go to                                           ${url_Dekd_Store}
    execute javascript                              window.scrollTo(0, 1100)
    Click Popular Product Button                    ${popular_product_btn}
    Click Goods In Popular Product To View          ${btn_view_new_product}

