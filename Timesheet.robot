*** Settings ***
Library             SeleniumLibrary
# Library             AutoRecorder    name=Timesheets
# Suite Setup         Open Timesheets
# Suite Teardown      Close Browser
# Test Setup        Open Timesheets
# Test Teardown     Close Browser

*** Variables ***
${browser}     headlesschrome
${browser1}    headlesschrome
${entronica}   https://timesheet.entro-lab.com/#/login
${user}        tawat.l
${pass}        123456
${text}        - Test API : address-info and list-address-by-account on IOT and on SIT.

*** Keywords ***
Open Timesheets
    Open Browser       ${entronica}    ${browser}       
    Set Selenium Speed          1s 
    Maximize Browser Window
    Wait Until Page Contains    Login
    Sleep                       1s
Input user
    Set Selenium Speed    1s
    Input Text            //input[@placeholder='User Name']    ${user}
Input pass
    Set Selenium Speed    1s
    Input Text            //input[@placeholder='Password']    ${pass}
Click login
    Set Selenium Speed    1s
    Click Button          //html/body/app-root/app-login/div/div/div[2]/div[4]/div/button
Click add timesheet
    Set Selenium Speed    1s
    Click Button          //*[@id="timeSheet"]/app-view-all-time-sheet/div[1]/div[1]/div[4]/button
Click project
    Set Selenium Speed    1s
    Click Element         //html/body/app-root/app-create-time-sheet/div/div[3]/div/div/div[1]/div[2]/select/option[3]
Click function
    Set Selenium Speed    1s
    Click Element         //html/body/app-root/app-create-time-sheet/div/div[3]/div/div/div[2]/div[2]/select/option[10]
Input description
    Set Selenium Speed    1s
    Input Text            id=textarea    ${text}
    Sleep                 1s
Click save
    Set Selenium Speed    1s
    Click Button          //html/body/app-root/app-create-time-sheet/div/div[5]/div/button[2]
    Capture Page Screenshot    Add_Timesheet.png
Click ok
    Set Selenium Speed    1s
    Click Button          //*[@id="btnPopupNavigateConfirm"]
    Sleep                 2s
    Capture Page Screenshot    Log_Timesheet.png
Click Home
    Set Selenium Speed    1s
    Click Element         xpath://*[@id="header-desktop"]/div[1]/img
    Sleep                 1s
    Close Browser
Open Check Timesheets
    Open Browser        ${entronica}    ${browser1}     
    Set Selenium Speed          1s
    Maximize Browser Window
    Wait Until Page Contains    Login
    Sleep                       1s
    Wait For Condition          return window.document.title == "Entronica Time Sheet"
    Sleep                       1s
Input user1
    Set Selenium Speed    1s
    Input Text            //input[@placeholder='User Name']    ${user}
Input pass1
    Set Selenium Speed    1s
    Input Text            //input[@placeholder='Password']    ${pass}
Click login1
    Set Selenium Speed    1s
    Click Button          //html/body/app-root/app-login/div/div/div[2]/div[4]/div/button
    Execute Javascript    window.scrollTo(0,200)
    Sleep                 2s
    Execute Javascript    window.scrollTo(0,0)
    Sleep                 1s
    Capture Page Screenshot    Check_Timesheet.png

*** Test Cases ***
Add_Timesheets
    # [Tags]      Timesheets    robot -i Timesheets Timesheet.robot Run Tags is Timesheets Only AND robot -e Timesheets Timesheet.robot Not Run Tags is Timesheets Only. 
    Open Timesheets     
    Input user
    Input pass
    Click login
    Click add timesheet
    Click project
    Click function
    Input description
    Click save
    Click ok
    Click Home 
    Open Check Timesheets       
    Input user1
    input pass1
    Click login1