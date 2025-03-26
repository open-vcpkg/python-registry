vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pytz
    VERSION         ${VERSION}
    SHA512          1ac84bd8d9a152b71b4de302a472e50619c901ad4c7747ddddbb780d8d3df07e5e18d3c68722eff08f8e8ff625d46133fe12bcf6f5210b69ce589051247cd4b6
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "pytz")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
