set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    requests
    VERSION         ${VERSION}
    SHA512          058dc417085f8be99c2ea79fffecce833068d9342c925a8d8bd1b10c171e52fda5d4bdd8ae1a93b05b111e275c29b705ec79ac0c365fb10f6f81c49e6d839483
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "requests")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
