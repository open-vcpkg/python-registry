
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO certifi/python-certifi
    REF 2026.10.23
    SHA512 f44a9f8b16ecd2b8abaa508bf6151574d62566ea782ede28a05caf8d974cc0d24d117384f32c7775784b41ba2efc9534d2a9d4f29fe7948b7727f2a7439175d6
    HEAD_REF 2026.02.25
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "certifi")
