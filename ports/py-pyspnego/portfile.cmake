vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pyspnego
    VERSION         ${VERSION}
    SHA512          a31cb6624262a4f0005a9eaa22d94e192a3577e9aaff26f6202a5da21c304b30e190278341162933b6dfe904f5fe6242ea8d81dae4a3bb1e7653172d9380d135
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "spnego")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
