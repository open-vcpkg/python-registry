vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO scikit-build/scikit-build
    REF ${VERSION}
    SHA512 35e870d7384a67bb699d7fa66e6e0623621061828354b7a135a96ebd4c6a14947febd0bde865fb64818451164ef18b89f74a3503df75df1fc2fa7deeb3ec17b2
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "skbuild")
