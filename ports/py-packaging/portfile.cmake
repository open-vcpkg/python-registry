vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pypa/packaging
    REF ${VERSION}
    SHA512 9c96b3f70e483af3812a859de217e58e07cc48210cfb3b7e64fbc3118bd7c53c39e9f5f33d13f532a4e0ce4c208bed58c64ed5ea16390371f3480706d72a9011
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "packaging")
