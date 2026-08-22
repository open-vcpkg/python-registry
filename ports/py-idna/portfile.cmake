set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    idna
    VERSION         ${VERSION}
    SHA512          9d80b04098d59eb2f2c82a91d1b8153aa5cf135dafc9f792b69d5efee05a1b7f441a907286741f85992a67b175e2910b2233bdf7492c61a3dc204ff74aed3aca
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

vcpkg_python_test_import(MODULE "idna")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
