*** Settings ***
Documentation       Automation test untuk Modul Cluster

Resource            ${CURDIR}/../../Resources/Clusters/Clusters.robot

Suite Setup         Clusters.Before
Suite Teardown      Clusters.After


*** Test Cases ***
tambah_data_cluster_baru
    [Documentation]    Test untuk tambah data cluster baru
    [Tags]    create    dev
    Tambah Data Cluster Berdasarkan Data Test Excel
    Collect the results

edit_data_cluster
    [Documentation]    Test untuk update cluster
    [Tags]    update    dev
    Ubah Data Cluster

hapus_data_cluster
    [Documentation]    Test untuk delete cluster
    [Tags]    delete    dev
    Hapus Data Cluster
