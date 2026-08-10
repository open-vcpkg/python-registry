set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    plotly
    VERSION         ${VERSION}
    SHA512          9e60016acac69a0f1428237d97b671319fb6a988b2d01c4c6efbe898bda5ea34f3db6310394e425260a889e291ac39c7a5c7ed65b60fb50256e366b4a5c172a5
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "plotly")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
