set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    charset-normalizer
    VERSION         ${VERSION}
    SHA512          e0682214fc75b5e2a2ce5284ead57ca2883f4151c1dbdfd8399c38ca14251fa53b6f598f87408b1d6dbd5636bf627eec481b582dfe3f314cad761b5d63433250
    FILENAME        charset_normalizer
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "charset_normalizer")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
