vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          d7e5ef4b785530b3f5b74952e944206abe621e2bf93569963d4f1f84c26063c79dc9d73a3dc112cb83ce89659fa5843128c8dab8e83c20a4f8dc94bbe0c84dda
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
