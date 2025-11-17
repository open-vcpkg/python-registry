set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    networkx
    VERSION         ${VERSION}
    SHA512          910e1400ad18711761c715896c3238b9c7d8914c571ab4db3aaf18a772b5fef90e5378ca435fbfce55b5821f1ddd3863a3cd65030086e80a971df91d9203c637
    FILENAME        networkx
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "networkx")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
