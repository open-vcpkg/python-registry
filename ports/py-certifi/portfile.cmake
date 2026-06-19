
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO certifi/python-certifi
    REF 2026.06.17
    SHA512 fd6f29d4034eebc8ad8f3999a394ed6c6ee853b41f2ae38e9f6bd07c05203f4f37c2c2f5d9cc5595fa1ee25d51074273668767bf235f4329930979cc85f8c59a
    HEAD_REF 2026.02.25
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "certifi")
