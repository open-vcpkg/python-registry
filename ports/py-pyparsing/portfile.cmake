vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pyparsing/pyparsing
    REF ${VERSION}
    SHA512 286bc52c3914ca874d3aab32db3505fc152b1511f1779a49fc00958a3d7ab6320d777857a8df4e4f55bfdc177e55779548e909722fe52ab1660eca02785f57fd
    HEAD_REF master
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
