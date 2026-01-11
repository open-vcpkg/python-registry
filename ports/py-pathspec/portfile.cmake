set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pathspec
    VERSION         ${VERSION}
    SHA512          8ca509c3085949827274efd73f5bb618b7446eab5e08e0c1a19b27dc5910d35b3e9dac36dc2f60152c2db4c95c776e5c4b9a436a17d9ade5da71a2bcf098dea8
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "pathspec")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
