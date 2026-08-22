vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pydantic/typing-inspection
    REF v${VERSION}
    SHA512 b39a7fbffc52f599809f0276c9cba01e54a2a30f9ef1fa94961faf586277917e0b756fac1a32e5ab9a8405c0c6a7a1629e7d85ad20e43e7f84581d77954c0efb
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "typing_inspection")
