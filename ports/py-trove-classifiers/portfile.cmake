set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME        trove-classifiers
    VERSION         ${VERSION}
    SHA512          4fca7cc5d172ddcb210bfbd6e993fc3d7243887762ba37c05aca3d6c5fcece8f573372704160c8048eb39c68d284fe808ca289c8c07564b06334bed6bafdc61e
    FILENAME        trove_classifiers
    FILENAME        trove_classifiers
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "trove_classifiers")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
