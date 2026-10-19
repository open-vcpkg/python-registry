
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO certifi/python-certifi
    REF 2026.10.18
    SHA512 92c23e93ab8dcefd00df771ff8b83b70ee61dd922cfa856f2ce5c9408439c5afcb01ff2a3d2c75ef4bf428a02192ca425ac2595489f43c1408486f9798ab3de3
    HEAD_REF 2026.02.25
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "certifi")
