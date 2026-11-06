set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    soupsieve
    VERSION         ${VERSION}
    SHA512          c70e187f08f3a3ac7a44a3c6108c51768fe3fdf89e2ea25990c5c33bad8c3084c23fbada153b4c18148f4b82945c1786b730e6ff52ed1d51fe804debbb57f207
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

# No import test: soupsieve imports bs4, which depends on this port. py-beautifulsoup4 tests it.

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
