vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pip-system-certs
    VERSION         ${VERSION}
    SHA512          b91ce14078dbe8ecb35347a83e1976ebd9b89b7624addb6d6892f6ac396922dac60316961781ae05785e622be7e41a75efbf9e64af0bebec304ad9743c7b73fe
    FILENAME        pip_system_certs
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pip_system_certs")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
