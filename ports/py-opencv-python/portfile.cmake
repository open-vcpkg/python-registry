# In a perfect world, this would be consuming the opencv package as a dependency.
# But that's not how upstream chose to see things

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    opencv-python
    VERSION         ${VERSION}
    SHA512          afef89288d9a02a35bdb883ae8d177f6fdf8771bdfe595667eac14d3dc6ec0d1eaa72f180274621c19a6d723bfb7d2567f1cfbc2e0129d558f6f5f7ffaacae0b
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "cv2")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
