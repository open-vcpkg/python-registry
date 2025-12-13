set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pysal
    VERSION         ${VERSION}
    SHA512          aca319e8d2128738e760fba7d6628493f200dc9ee46e952e49b2176337acad03dfce9c0e455e6f7305507af7717ccaecc9d796a0bd7e33f122a54c7dac2d1630
    FILENAME        pysal
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "pysal")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
