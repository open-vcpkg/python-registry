vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pip
    VERSION         ${VERSION}
    SHA512          0f04c3867fcd0c707e9b532f9b85940e7fd3d822b6d71ce418d2f75746449cd12a1b85bee75c88ada1336c26d5ea2886340f70a1a0c0612534108a2d2145ebf7
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
