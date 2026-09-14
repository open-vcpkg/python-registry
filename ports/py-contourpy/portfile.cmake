vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    contourpy
    VERSION         ${VERSION}
    SHA512          3664481b9a78d5d97c69c3ab6cb106798766af1eca9763310f9fa144d6e9574f98d0786158b2963c8490402c4ec3acb284371acbe84d9e33185157ea1260f675
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
