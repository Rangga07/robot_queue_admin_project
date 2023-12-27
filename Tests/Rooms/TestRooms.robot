*** Settings ***
Documentation       Automation test untuk Modul Rooms

Resource            ${CURDIR}/../../Resources/Rooms/Rooms.robot

Suite Setup         Rooms.Before
Suite Teardown      Rooms.After


*** Test Cases ***
tambah_data_rooms_baru
    [Documentation]    Test untuk tambah data rooms baru
    [Tags]    create    dev
    Tambah Data Rooms Berdasarkan Data Test Excel
    Collect the results

edit_data_cluster
    [Documentation]    Test untuk update rooms
    [Tags]    update    dev
    Ubah Data Room
