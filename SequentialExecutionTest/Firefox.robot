*** Settings ***
Library    SeleniumLibrary  
*** Variables ***
${URL}    https://www.amazon.in/
${FirefoxBrowser}    ff   
*** Test Cases ***
Cross Browser Testing with Firefox Browser
    [Documentation]    FireFox Browser with Amazon web site
    Open Browser    ${URL}    ${FirefoxBrowser}   None	http://10.100.20.113:4444/wd/hub
    
Get Amazon title
    Sleep    5s    
    ${GetValue}=  Get Element Attribute    xpath=.//a[@aria-label='Amazon']    aria-label
    Log To Console    ${GetValue}   
    Should Be Equal    ${GetValue}    Amazon   
    Log To Console    Amazon web site title verified successfully      

Close browser     
    Sleep    10s  
    Close Browser  
    
