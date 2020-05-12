*** Settings ***
Library  SeleniumLibrary
Variables  ..//Config//config.py
Variables  ..//Variable//Locator.py
Variables  ..//Variable//inputs.py
*** Variables ***
${text}     Covid19.org
*** Test Cases ***
Login
    Open Browser    ${url}      ${browser}
    Maximize Browser Window
    Enter Text In Text Box  ${username_input}    ${username}
    Enter Text In Text Box  ${userpassword_input}    ${password}
    Click Button        ${login_button}

    #Press Keys       ${searchbar}        ENTER
    #Click Element   ${searchbar}
    #Input Text      ${searchbar}    "ABC"
    #Close Browser

Create User
    Hover Element       ${hoveradmin}
    Hover Element       ${hoveradmin}
    Hover Element       ${hoverusermanagement}
    Click Button        ${users}
    Click Button        ${adduser}
    Click Button        //*[@id="systemUser_userType"]
    sleep   ${small_wait}
    Select From Drop Down   ${user_drop_down}      ${user_index}
    Enter Text In Text Box     ${employeename_input}   ${add_user_name}
    sleep  ${small_wait}
    Click Button    ${select_from_search_result}
    Enter Text In Text Box     ${add_user_name_input}   ${new_user_name}
    Select From Drop Down       ${status_dropdown}      ${status_drop}
    Enter Text In Text Box  ${add_user_passwword_input}     ${new_password}
    Enter Text In Text Box  ${add_user_confirm_passwword_input}     ${confirm_new_password}
    sleep   ${small_wait}
    Click Button  ${add_user_save_btn}

Verify Create User
    #log to console  ${new_user_name}
    sleep  ${large_wait}
    Page Should Contain Element   //*[@id="resultTable"]/tbody/tr/td[2]/a[contains(text(),'${new_user_name}')]

*** Keywords ***
Enter Text In Text Box
    [Arguments]     ${box}  ${text}
    Click Element   ${box}
    Input Text      ${box}    ${text}

Click Button
    [Arguments]  ${button}
    Click Element   ${button}

Hover Element
    [Arguments]     ${hoverelement}
    Mouse Over      ${hoverelement}
Select From Drop Down
    [Arguments]     ${Dropdown}     ${val}
    Select From List By Value   ${Dropdown}     ${val}


