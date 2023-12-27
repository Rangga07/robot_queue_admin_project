*** Settings ***
Documentation       Keyword automation test modul Cluster

Variables           ${CURDIR}/../../Variables/Clusters/VariableCluster.py
Variables           ${CURDIR}/../../Variables/Rooms/VariableRoom.py
Resource            ${CURDIR}/../../Resources/Settings/Login.robot
Library             RPA.Excel.Files


*** Variables ***
${menu_cluster}                 xpath=//a[@href="/admin/content/clusters"]
${menu_clinic}                  xpath=//a[@href="/admin/content/kliniks"]
${menu_room}                    xpath=//a[@href="/admin/content/rooms"]
${btn_add}                      xpath=//a[@href="/admin/content/clusters/+"]
${btn_save}                     xpath=//header/div[5]/div[2]/div[2]/button
${btn_update2}                  xpath=(//i)[15]
${btn_update}                   xpath=//header/div[5]/div[2]/div[3]/button
${btn_delete}                   xpath=//*[@id="main-content"]/header/div[5]/div[2]/div[2]/div/button/span/span/i
${btn_delete_confirm}           xpath=//*[@id="dialog-outlet"]/span/div[2]/div[2]/div[2]/button
${inpt_alias_cluster}           xpath=//textarea[@class="sans-serif"]
${inpt_nama_cluster}            xpath=(//textarea[@class="sans-serif"])[2]
${inpt_deskripsi_cluster}       xpath=(//textarea[@class="sans-serif"])[3]
${inpt_tts_cluster}             xpath=(//textarea[@class="sans-serif"])[4]
${inpt_lantai_cluster}          xpath=(//textarea[@class="sans-serif"])[5]
${pilih_data}                   xpath=//table/tbody/tr[12]/td[4]
${pilih_data_hapus}             xpath=//*[@id="main-content"]/main/div[1]/div/table/tbody/tr[1]/td[2]
${inpt_type_room}               xpath=//textarea[@class="sans-serif"]
${inpt_cluster_id_room}         xpath=(//input)[2]
${inpt_name_room}               xpath=(//textarea[@class="sans-serif"])[2]
${inpt_tts_room}                xpath=(//textarea[@class="sans-serif"])[3]
${inpt_alias_room}              xpath=(//textarea[@class="sans-serif"])[4]
${inpt_description_room}        xpath=(//textarea[@class="sans-serif"])[5]
${excel_file_path}              Data/ClusterData.xlsx


*** Keywords ***
Before
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Login.Login Single Queue Success
    Wait Until Element Is Visible    xpath=//div[@class="v-text-overflow"]
    Click Element    ${menu_cluster}

After
    Close Browser

View List Data Clusters
    Wait Until Element Is Visible    xpath=//div[@class="v-text-overflow"]

Tambah Data Cluster
    [Arguments]    ${cluster_index}
    Click Element When Visible    ${btn_add}
    Input Text    ${inpt_alias_cluster}    ${cluster_index}[Alias]
    Input Text    ${inpt_nama_cluster}    ${cluster_index}[Nama]
    Input Text    ${inpt_deskripsi_cluster}    ${cluster_index}[Deskripsi]
    Input Text    ${inpt_tts_cluster}    ${cluster_index}[Text to Speech]
    Input Text    ${inpt_lantai_cluster}    ${cluster_index}[Lantai]
    Click Element    ${btn_save}

Tambah Data Cluster Berdasarkan Data Test Excel
    Open Workbook    ${excel_file_path}
    ${clusters}=    Read Worksheet As Table    header=true
    Close Workbook
    FOR    ${cluster_index}    IN    @{clusters}
        Tambah Data Cluster    ${cluster_index}
    END

Collect the results
    Sleep    ${wait}
    Screenshot
    ...    css:div.content
    ...    ${OUTPUT_DIR}${/}Result/Screenshots/Clusters/test_tambahdata_${unique_id_by_time}.png

Ubah Data Cluster
    Wait Until Element Is Visible    //div[@class="v-text-overflow"]
    Click Element    ${menu_cluster}
    Sleep    ${wait}
    Click Element    ${pilih_data}
    Sleep    ${wait}
    Input Text    ${inpt_alias_cluster}    ${update_alias_cluster}
    Input Text    ${inpt_nama_cluster}    ${update_nama_cluster}
    Input Text    ${inpt_deskripsi_cluster}    ${update_deskripsi_cluster}
    Input Text    ${inpt_tts_cluster}    ${update_tts_cluster}
    Input Text    ${inpt_lantai_cluster}    ${update_lantai_cluster}
    Click Element    ${btn_update}

Hapus Data Cluster
    Wait Until Element Is Visible    //div[@class="v-text-overflow"]
    Click Element    ${menu_cluster}
    Sleep    ${wait}
    Click Element    ${pilih_data_hapus}
    Sleep    ${wait}
    Click Element    ${btn_delete}
    Click Element When Visible    ${btn_delete_confirm}
