*** Settings ***
Documentation       Keyword automation test modul Rooms

Variables           ${CURDIR}/../../Variables/Rooms/VariableRoom.py
Resource            ${CURDIR}/../../Resources/Settings/Login.robot
Library             RPA.Excel.Files


*** Variables ***
${menu_cluster}             xpath=//a[@href="/admin/content/clusters"]
${menu_clinic}              xpath=//a[@href="/admin/content/kliniks"]
${menu_room}                xpath=//a[@href="/admin/content/rooms"]
${btn_add}                  xpath=//a[@href="/admin/content/rooms/+"]
${btn_save}                 xpath=//*[@id="main-content"]/header/div[5]/div[2]/div[2]/button
${btn_update}               xpath=(//i)[15]
${pilih_data}               xpath=//*[@id="main-content"]/main/div[1]/div/table/tbody/tr[1]/td[2]
${inpt_type_room}           xpath=//textarea[@class="sans-serif"]
${inpt_cluster_id_room}     xpath=(//input)[2]
${inpt_name_room}           xpath=(//textarea[@class="sans-serif"])[2]
${inpt_tts_room}            xpath=(//textarea[@class="sans-serif"])[3]
${inpt_alias_room}          xpath=(//textarea[@class="sans-serif"])[4]
${inpt_description_room}    xpath=(//textarea[@class="sans-serif"])[5]
${excel_file_path}          Data/RoomsData.xlsx


*** Keywords ***
Before
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Login.Login Single Queue Success
    Wait Until Element Is Visible    //div[@class="v-text-overflow"]
    Click Element    ${menu_room}

After
    Close Browser

Tambah Data Room
    [Arguments]    ${rooms_index}
    Click Element When Visible    ${btn_add}
    Input Text    ${inpt_type_room}    ${rooms_index}[Room Type]
    Input Text    ${inpt_cluster_id_room}    ${rooms_index}[Cluster ID]
    Input Text    ${inpt_name_room}    ${rooms_index}[Name]
    Input Text    ${inpt_tts_room}    ${rooms_index}[Text to Speech]
    Input Text    ${inpt_alias_room}    ${rooms_index}[Alias Name]
    Input Text    ${inpt_description_room}    ${rooms_index}[Descriptions]
    Click Element    ${btn_save}

Tambah Data Rooms Berdasarkan Data Test Excel
    Open Workbook    ${excel_file_path}
    ${rooms}=    Read Worksheet As Table    header=true
    Close Workbook
    FOR    ${rooms_index}    IN    @{rooms}
        Tambah Data Room    ${rooms_index}
    END

Collect the results
    Sleep    ${wait}
    Screenshot    css:div.content    ${OUTPUT_DIR}${/}Result/Screenshots/Rooms/test_tambahdata_${uniq_id_by_time}.png

Ubah Data Room
    Wait Until Element Is Visible    //div[@class="v-text-overflow"]
    Click Element    ${menu_room}
    Sleep    ${wait}
    Click Element    ${pilih_data}
    Sleep    ${wait}
    Input Text    ${inpt_type_room}    ${update_room}
    Input Text    ${inpt_cluster_id_room}    ${update_cluster_id_room}
    Input Text    ${inpt_name_room}    ${update_name_room}
    Input Text    ${inpt_tts_room}    ${update_tts_room}
    Input Text    ${inpt_alias_room}    ${update_alias_name_room}
    Input Text    ${inpt_description_room}    ${update_description_room}
    Click Element    ${btn_update}
