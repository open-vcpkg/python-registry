
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO certifi/python-certifi
    REF 2026.02.25
    SHA512 8109e9d647680f58f536f037e776e36701556e80c45750da296a77fa3218b57d9c51144c0bf70eb79908d15fbaea61c87f80a26f10f6341474ebd1fe7fbf7dad
    HEAD_REF 2026.02.25
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "certifi")
