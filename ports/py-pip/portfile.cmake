vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pip
    VERSION         ${VERSION}
    SHA512          7fbcdd1f3f49ccc2b635b3f464488fedbafc71c2c18e2f801b2bc00c765c3ffbe3068050ea9a2964c93975c87a1f27d0188e7d01a9a17893dd6d2593ec58cf69
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
