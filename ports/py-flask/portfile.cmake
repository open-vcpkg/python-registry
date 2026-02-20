vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    Flask
    VERSION         ${VERSION}
    SHA512          17c290fdccf3c7e45eeaf5d12a967889f6b0c6aac06a518624a18eb4de67904e825a2724d0c4d7701bb7e75a2f4629089a658e30909c6c7fe20992cc431b273e
    FILENAME        flask
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "flask")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
