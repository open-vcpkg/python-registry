vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO annotated-types/annotated-types
    REF v${VERSION}
    SHA512 1cd43119f9127bcf68929a53158a91cef94d16b7bae3647b830899089b05bb66070ca4ac052e2a0b2fadbe567bca01d7773006568382034b3fbe20678d5fdc9c
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "annotated_types")
