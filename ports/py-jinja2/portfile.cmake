vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    Jinja2
    VERSION         ${VERSION}
    SHA512          bddd5e142f1462426c57b2efafdfafdfc6b66de257668707940896feae71eabdf19e0b6e34ef49b965153baf9b1eb59bb5a97349bb287ea0921dd2a751e967ab
    FILENAME        jinja2
    FILENAME        jinja2
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
