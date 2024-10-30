vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO hukkin/tomli
    REF ${VERSION}
    SHA512 3eeea334d6d225590a9e074685c65d052e2f5d5286ca895ff7e9532d7289f0daa31ae67b5076d803e5adad4f20a9831058a0c4599715f049079904934d3d9c25
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "tomli")
