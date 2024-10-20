vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    autopep8
    VERSION         ${VERSION}
    SHA512          27751ea37d3067efb693acf4872b9e15f1815f1d4116d73b504d491382e4e54337afaef4a1f171979d4cc737b0014e8ebfbc0d34fe02255c39c6b5b09c263067
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "autopep8")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
