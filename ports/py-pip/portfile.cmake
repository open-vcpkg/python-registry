vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pip
    VERSION         ${VERSION}
    SHA512          eccaba8f0d0e910fe91fb5036cbec8cbff48300c4b5443a7eff7164b0f59339f24db75034cc1a3e8360111198877baf1a348bbfb9e99449d45ee1d37afca5467
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
