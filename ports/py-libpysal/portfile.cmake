vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    libpysal
    VERSION         ${VERSION}
    SHA512          bee3332ad719184972148f9aa1421c6c6fd5bfb5b705e1ac557d319471149722d7ceba0d39e2adc827d15d7728613801f97976337d0317af5fe7ef223546f1e7
    FILENAME        libpysal
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "libpysal")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)