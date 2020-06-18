*** Settings ***
Library    SeleniumLibrary  
*** Variables ***
${URL}    https://www.flipkart.com/
${ChromeBrowser}    chrome  
*** Test Cases ***
Cross Browser Testing with Chrome Browser
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    ${options}=     Call Method     ${chrome_options}    to_capabilities     

    Create Webdriver    Remote   command_executor=http://10.100.20.113:4444/wd/hub    desired_capabilities=${options}
   
    Go to     ${URL}

    Maximize Browser Window
    
    
Get Flipkart title
    Sleep    5s    
    ${GetValue}=  Get Element Attribute    xpath=.//img[@title='Flipkart']    title
    Log To Console    ${GetValue}   
    Should Be Equal    ${GetValue}    Flipkart 
    Log To Console    Flipkart web site title verified successfully    

Close browser     
    Sleep    10s  
    Close Browser  
    