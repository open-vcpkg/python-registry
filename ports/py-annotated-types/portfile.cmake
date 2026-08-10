vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO annotated-types/annotated-types
    REF v${VERSION}
    SHA512 ec55f24602a4a70f49630e1e8f3302d5f1f8f82129e3c0c16c0e083a18b6c832c5c89226d673042a8a185e807090ba950ca56b363ba1a65c336084e2591e9fbd
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "annotated_types")
