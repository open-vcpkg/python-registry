vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    hatch-fancy-pypi-readme
    VERSION         ${VERSION}
    SHA512          04b930498dc707cd66009354c30185c121f2eb056534eacf290eabfe6aabf21d9f766e0d453ec6be6648380e37a7e18c632a7198375209e76995db162a698fe4
    FILENAME        hatch_fancy_pypi_readme
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "hatch_fancy_pypi_readme")
