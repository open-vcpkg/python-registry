
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO certifi/python-certifi
    REF 2026.05.20
    SHA512 15be1720602a96446f442cca91f2c96ee4fb57612d90f18b68942431bb17a8136e517db550ed0bec01e44d985cb630650018f8d32ddbd77963c8544b5e457b62
    HEAD_REF 2026.02.25
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "certifi")
