set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    hatchling
    VERSION         ${VERSION}
    SHA512          e48055970b0b6d0752d704c89c660d11530c2594c24eb8d4660b6ae53d79fa8170b0306481c8a8bca3d06feb4476bcdd79d9c1a5dea3c7a4f84a762ecfd5c594
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "hatchling")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
