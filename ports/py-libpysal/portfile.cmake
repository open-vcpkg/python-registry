vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    libpysal
    VERSION         ${VERSION}
    SHA512          eaab85b8ce83bccd9cb22671f5e27a1db245db850bef7e80f37ce667876bbed91224a20d72ee976f9fbdc9d3f3a90d58343bde1cd0b6f9a2fe1bbf5abd23be3a
    FILENAME        libpysal
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "libpysal")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)