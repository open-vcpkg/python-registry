set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    markupsafe
    VERSION         ${VERSION}
    SHA512          1d5342766fae024a243e12a2ad384724ec2a9ea5dfd4af1651725ef5201bcec5ca2e520720a05d05d3ca91fcdbf78e00afec6a70a73146ab29e29c6989559651
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "markupsafe")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
