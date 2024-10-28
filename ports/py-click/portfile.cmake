vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    click
    VERSION         ${VERSION}
    SHA512          c67146ad0112daf8ed4db62a6b0a0065109332eb8fa31962ce40d61e27e2736020a0cadfebdd1656e2f23c20291b069d3a409faffe999a0907e6dbdef77aa014
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.rst")
vcpkg_python_test_import(MODULE "click")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
