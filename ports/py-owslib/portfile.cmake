vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    OWSLib
    VERSION         ${VERSION}
    SHA512          1bdaab334eb6fc8569ac1fb08e97538186f5d85cd3769597764666544d95ec7adc0e94a301518596fb8c1bd106efbe1e36b34e510686bae91c66a6eefec2c5c6
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "owslib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
