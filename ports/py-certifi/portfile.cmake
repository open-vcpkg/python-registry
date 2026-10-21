
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO certifi/python-certifi
    REF 2026.10.19
    SHA512 94bc3671aaf2a2aa9d90a2e6730778764eafc2200ca0a55eaaa8b003a1f0f25269bda207cd61072ae90884b81d157d7767c7f70c502fbe7ea901144fe3987aeb
    HEAD_REF 2026.02.25
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "certifi")
