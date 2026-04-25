vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pypa/packaging
    REF ${VERSION}
    SHA512 28a93b2c3ff099eb4ebe82ac09d3c7e7260de37918558d495e2d84a1a8f67603b4b9adb87633ee3d00d953fc0ed50f8b54f573c97ece134fa9b3f5eb636bf05f
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "packaging")
