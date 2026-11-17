set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    soupsieve
    VERSION         ${VERSION}
    SHA512          94df14a715bc901a5925f64378ccfa1f505a072fa15f3e86a91cdc1e8aa8bfad608a3a7117020ff04fb669d214dd0210cb2857316e2a1c1b8b0d868032fc8817
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

# No import test: soupsieve imports bs4, which depends on this port. py-beautifulsoup4 tests it.

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
