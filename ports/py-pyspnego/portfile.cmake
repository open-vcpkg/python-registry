vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pyspnego
    VERSION         ${VERSION}
    SHA512          3fac72600e162aed20d888727d74f67a7f1ae44aa000e0290c25e66a86d37bf2afb0718b36084926316149cb5157affe8beac65507b4d6e924d810c9aa6d86dc
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pyspnego")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
