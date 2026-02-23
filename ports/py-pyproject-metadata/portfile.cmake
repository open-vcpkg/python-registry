vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FFY00/python-pyproject-metadata
    REF ${VERSION}
    SHA512 6f56d2c59118027da4d00c1f2df06ebadc296f810576b28ff6b28ee472c2c0cef72b1bbe7d36480679740b1dd91acdc9d693246dfc921b7bf012886f17a87c0d
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "pyproject_metadata")
