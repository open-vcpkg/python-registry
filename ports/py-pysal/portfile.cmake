set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pysal
    VERSION         ${VERSION}
    SHA512          a3342a61a9d27814f055902deca0b43c93599624846ba34fce904fecfc06a4ccc4623fea947bc499a8e1636fda333c22555627a79135c69f7e44e7b9dd5932b6
    FILENAME        pysal
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "pysal")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
