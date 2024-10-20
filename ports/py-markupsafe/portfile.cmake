set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME        MarkupSafe
    VERSION         ${VERSION}
    SHA512          26946b928b001933f08a5dd90c5fe424a1d9e2bccfbf7194955d031a3df54a03eb48e4e47ea9564a25da33efeb62a043a53008f551fa1e8d71321bc276e19ce2
    FILENAME        markupsafe
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "markupsafe")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
