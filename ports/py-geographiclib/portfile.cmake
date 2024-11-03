vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    geographiclib
    VERSION         ${VERSION}
    SHA512          08e67317b83ed96dc45b013bfc0eac771f015250da07b1574252f566f48ce944ad0a5a0623b1bfc96c14e65658f2f39a069af5ceb6ffe153677cc2a023eeef91
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "geographiclib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
