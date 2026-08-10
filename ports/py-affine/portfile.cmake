set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    affine
    VERSION         ${VERSION}
    SHA512          37e5f2c1179c4e5a15997dfa6b399d1490e5647f672361acbdb2b681d83fcaaa8fc34114286ce1bfe5cfa0680e43b8eaef2a2e0eed47ddcd2e4462aa8aac77e3
    FILENAME        affine
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "affine")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
