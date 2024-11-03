# In a perfect world, this port would be a feature of py-opencv-python[contrib]
# But in a perfect world, we wouldn't have to deal with the topic of missing submodules in vcpkg ports

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    opencv-contrib-python
    VERSION         ${VERSION}
    SHA512          e4723c84a6035cedacd32cd2a50ae4e6d0a7095d9e21e80e275086e0260bcf2723cf189492b7909f90786ccf776956c628eb461c136ecf791a00658a6991159d
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "cv2")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
