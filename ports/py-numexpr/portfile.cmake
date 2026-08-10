vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    numexpr
    VERSION         ${VERSION}
    SHA512          7c6900bd054f54fb1a23777f0d41f14871e4379c2eb7fa4e1be66d6465db20db6d2294875d1efb87b3f3e476290736c673562cf91a072852156ac14089fc73f2
)
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "numexpr")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)