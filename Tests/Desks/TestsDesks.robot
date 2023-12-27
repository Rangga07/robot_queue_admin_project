*** Settings ***
Documentation       Automation test untuk Modul Desks

Variables           ${CURDIR}/../../Config/Environment.py
Resource            ${CURDIR}/../../Resources/Settings/Login.robot
Resource            ${CURDIR}/../../Resources/Desks/Desks.robot

Suite Setup         Desks.Before
Suite Teardown      Desks.After


*** Test Cases ***
tambah_data_desks_baru
    [Documentation]    Test untuk tambah data desks baru
    [Tags]    create    dev
    Tambah Data Desks Berdasarkan Data Test Excel
    Collect the results

edit_data_desks
    [Documentation]    Test untuk update desks
    [Tags]    update    dev
    Ubah Data Desks

hapus_data_cluster
    [Documentation]    Test untuk delete desks
    [Tags]    delete    dev
    Hapus Data Desks
