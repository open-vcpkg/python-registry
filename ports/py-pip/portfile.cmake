vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pip
    VERSION         ${VERSION}
    SHA512          9318ad22f97ffd54f1152052c83244d573a95648c3abcbc6bf01761e6785257726e0103bda600ded9338c308ac7de274fe93573da0bb5e590ced8da8847dc335
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
