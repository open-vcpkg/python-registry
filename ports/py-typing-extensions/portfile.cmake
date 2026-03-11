vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO python/typing_extensions
    REF ${VERSION}
    SHA512 f394a9a8b589f4b73185774fd66b3b418b2047e6e44b482b2e24c1ebe67300fb44822d41575c02bb2908002f58f8b200b9270a709c5c6ebc93477cc18db33fbe
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "typing_extensions")
