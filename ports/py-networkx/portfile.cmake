set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    networkx
    VERSION         ${VERSION}
    SHA512          a2864f7896e3b20d2dc24744494ffa14ff5aa6ffa938c5b49937236706ec193f0777cda3cbb2993f4dbf51137a0aed8246af0c2d900385222cd32e917d6b5c64
    FILENAME        networkx
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "networkx")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
