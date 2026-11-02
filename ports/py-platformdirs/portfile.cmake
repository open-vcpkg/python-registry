vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    platformdirs
    VERSION         ${VERSION}
    SHA512          ec3d5a9ad425826cd81de2c7653b4868c75f8f0b1f567d01730c49a9e7218493f548e4a8f3ef425ff3669fda3b29e7a08942a53b85f4481effa6a261d6e82a04
    FILENAME        platformdirs
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "platformdirs")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)