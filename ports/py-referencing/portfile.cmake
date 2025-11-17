set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    referencing
    VERSION         ${VERSION}
    SHA512          b737afb45bfb1adb91f457b78ab4a31a6f33839ef61095663fd66d91c09fc379d900f778bacaa36722770ce80eccd6a227a074cb44836e69205bed06165d033d
    FILENAME        referencing
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")

vcpkg_python_test_import(MODULE "referencing")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
