vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pip
    VERSION         ${VERSION}
    SHA512          0acc2d13845f5ad164db491d26c00b0f9f30e211ea2d735ccd3017b67e1daa2d7c42f75376fcc5a061f2d0591bdd7b484a9f08cd063e5ce471e76cea659ff566
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
