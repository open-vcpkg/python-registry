vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    Werkzeug
    VERSION         ${VERSION}
    SHA512          2bc6b67aa1cac571bd30c59818483e8ef73cd07be2154ce52703429ba29e2f8a8caf2e174291d977df16b944a1f3137b0646effdfb43df8058f6562a2c0bcc04
    FILENAME        werkzeug
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "werkzeug")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
