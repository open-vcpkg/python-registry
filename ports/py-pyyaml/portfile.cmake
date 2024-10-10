vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME        PyYAML
    VERSION         ${VERSION}
    SHA512          a675e0056bb6af9119c7f2796e349ced05afca64118a5b444d66dafcb6a774cf274eeba7eab044b86eb6c12a9d7c785c654f6cf229e1d190340dd06ea76e25ec
    FILENAME        pyyaml
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
