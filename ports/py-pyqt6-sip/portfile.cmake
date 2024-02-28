set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt6_sip
    VERSION         ${VERSION}
    SHA512          ef363b21899f6d089fbc6d5adf700dc6c8838501343070ed1cf0826e05dd860343eba608d5aee5d8bece39b8ddca1f37866bb56aa07db18384ac0a372ca3532f
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "PyQt6.sip")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)