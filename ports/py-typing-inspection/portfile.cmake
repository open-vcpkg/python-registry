vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pydantic/typing-inspection
    REF v${VERSION}
    SHA512 8661c5e8da636d6b4269ef99dcd3fc34cc1157a64c1aae5ba2a94495668a5b0171fdeae9a8f64e5e1d2e8bd9194517984a9514e0443a0c5d3d8abaab07f141bf
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "typing_inspection")
