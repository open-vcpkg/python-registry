set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    hatchling
    VERSION         ${VERSION}
    SHA512          e5bf8b63b80cb49776571a5e3a5161017035dfbc66dac4cc8c4a6b5854ca76aeca84536318dc76484b1e625e048ffaa4f4d3f17c6157c79bf56ef515b971a116
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "hatchling")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
