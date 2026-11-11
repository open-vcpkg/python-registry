set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    soupsieve
    VERSION         ${VERSION}
    SHA512          c73a83e83adaf409a25b47eaa0a727e922b9fafc787e313cef961f49081ac5c13fbd77ee1653e2947e74cbc9f4f2a7047b73a413c297ab2e1348d8a443df20f3
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

# No import test: soupsieve imports bs4, which depends on this port. py-beautifulsoup4 tests it.

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
