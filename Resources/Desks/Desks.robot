*** Settings ***
Documentation       Keyword automation test modul Desks

Variables           ${CURDIR}/../../Config/Environment.py
Variables           ${CURDIR}/../../Variables/Desks/VariableDesks.py
Resource            ${CURDIR}/../../Resources/Settings/Login.robot
Library             RPA.Excel.Files


*** Variables ***
${menu_desk}                xpath=//a[@href="/admin/content/desks"]
${menu_room}                xpath=//a[@href="/admin/content/rooms"]
${btn_add}                  xpath=//a[@href="/admin/content/desks/+"]
${btn_save}                 xpath=//*[@id="main-content"]/header/div[5]/div[2]/div[2]/button
${btn_update2}              xpath=(//i)[15]
${btn_update}               xpath=//header/div[5]/div[2]/div[3]/button
${btn_delete}               xpath=//*[@id="main-content"]/header/div[5]/div[2]/div[2]/div/button
${btn_delete_confirm}       xpath=//*[@id="dialog-outlet"]/span/div[2]/div[2]/div[2]/button
${inpt_nama_desks}          xpath=//textarea[@class="sans-serif"]
${inpt_alias_desks}         xpath=(//textarea[@class="sans-serif"])[2]
${inpt_tts_desks}           xpath=(//textarea[@class="sans-serif"])[3]
${inpt_deskripsi_desks}     xpath=(//textarea[@class="sans-serif"])[4]
${cari_data}                xpath=//form/div[3]/div[2]/div/div[1]
${pilih_data}               xpath=//*[@id="main-content"]/main/div[1]/div/table/tbody/tr[1]/td[2]
${excel_file_path}          Data/DesksData.xlsx


*** Keywords ***
Before
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Login.Login Single Queue Success
    Wait Until Element Is Visible    //div[@class="v-text-overflow"]
    Click Element    ${menu_desk}

After
    Close Browser

Tambah Data Desks
    [Arguments]    ${desks_index}
    Click Element When Visible    ${btn_add}
    Input Text    ${inpt_nama_desks}    ${desks_index}[Name]
    Input Text    ${inpt_alias_desks}    ${desks_index}[Alias]
    Input Text    ${inpt_tts_desks}    ${desks_index}[Text to Speech]
    Input Text    ${inpt_deskripsi_desks}    ${desks_index}[Deskripsi]
    Click Element    ${btn_save}

Tambah Data Desks Berdasarkan Data Test Excel
    Open Workbook    ${excel_file_path}
    ${desks}=    Read Worksheet As Table    header=true
    Close Workbook
    FOR    ${desks_index}    IN    @{desks}
        Tambah Data Desks    ${desks_index}
    END

Collect the results
    Sleep    ${wait}
    Screenshot
    ...    css:div.content
    ...    ${OUTPUT_DIR}${/}Result/Screenshots/Desks/test_tambahdata_${unique_id_by_time}.png

Tambah Data Desks Cancel Save
    Wait Until Element Is Visible    //div[@class="v-text-overflow"]

Ubah Data Desks
    Wait Until Element Is Visible    //div[@class="v-text-overflow"]
    Click Element    ${menu_desk}
    Sleep    ${wait}
    Click Element    ${pilih_data}
    Sleep    ${wait}
    Input Text    ${inpt_nama_desks}    ${update_nama_desks}
    Input Text    ${inpt_alias_desks}    ${update_alias_desks}
    Input Text    ${inpt_tts_desks}    ${update_tts_desks}
    Input Text    ${inpt_deskripsi_desks}    ${update_deskripsi_desks}
    Click Element    ${btn_update}

Hapus Data Desks
    Wait Until Element Is Visible    //div[@class="v-text-overflow"]
    Click Element    ${menu_desk}
    Sleep    ${wait}
    Click Element    ${pilih_data}
    Sleep    ${wait}
    Click Element    ${btn_delete}
    Click Element When Visible    ${btn_delete_confirm}
