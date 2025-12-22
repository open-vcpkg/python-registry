set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    urllib3
    VERSION         ${VERSION}
    SHA512          6a12cd56ac3a437e3f7213ea0eb0456a71ac85e373df5c4b7dc52098ee0c181256d87bc17b1fe1a734d97f8d01589858178ea9b8bacddc46601de9e32f32cd23
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "urllib3")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
