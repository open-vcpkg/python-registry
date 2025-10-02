set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    MarkupSafe
    VERSION         ${VERSION}
    SHA512          8c4ed04b467244f6bf99cd2a60ed922bc0569581f00cc5a13d9edcd0a4bc8b97c404edc4576f6146c7aa543bbd37cf52e5312d3bdd27758264d8751fdc7a646c
    FILENAME        markupsafe
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "markupsafe")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
