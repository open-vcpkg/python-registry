vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    libpysal
    VERSION         ${VERSION}
    SHA512          f1390c0854775306ad37f4cf35ee337cfbd712a2b4f49064c73c0492b415b4be3fbc04c5ba9c60cbdd408cb722b2a54ccec3538929c7ea2ea8df9cf9b10c9438
    FILENAME        libpysal
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "libpysal")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)