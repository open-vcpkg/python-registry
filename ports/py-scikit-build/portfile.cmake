vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO scikit-build/scikit-build
    REF ${VERSION}
    SHA512 410c142de5330471177109cb22cfa6fae9af68abb210268dde7d7af80e6fe54a128c77e561bebecc232f3d83275b80b5daf48688ed0eab89f015b445e90a736b
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "skbuild")
