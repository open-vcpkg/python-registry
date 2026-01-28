vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pycparser
    VERSION         ${VERSION}
    SHA512          333504ef076e369661823abcd1d1f0d4e01ebadd43b7039e403d80fc2418500c2ed2c42e7b997c6eaf9c56b16085dfccacc6d0be2d45f0033a90eac1a7ed49d0
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pycparser")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
