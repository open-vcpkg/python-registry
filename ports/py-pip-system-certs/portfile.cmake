vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pip-system-certs
    VERSION         ${VERSION}
    SHA512          0b1ac7b2aeb3a3c47e96886940ea0914aacd015614f7799b7d545a70b1958c6656199b5043b1c68cf90bbfe07b7b87c5cbb88fb54ceffe4b91bd12a680d23ddc
    FILENAME        pip_system_certs
)

# Fix: redirect error messages to stderr to avoid corrupting stdout of build tools (e.g. meson introspection)
vcpkg_replace_string("${SOURCE_PATH}/pip_system_certs/wrapt_requests.py"
    "import ssl"
    "import ssl\nimport sys"
)
vcpkg_replace_string("${SOURCE_PATH}/pip_system_certs/wrapt_requests.py"
    [[print("pip_system_certs: ERROR: truststore not available")]]
    [[print("pip_system_certs: ERROR: truststore not available", file=sys.stderr)]]
)
vcpkg_replace_string("${SOURCE_PATH}/pip_system_certs/wrapt_requests.py"
    [[print("pip_system_certs: ERROR: could not inject truststore:", ex)]]
    [[print("pip_system_certs: ERROR: could not inject truststore:", ex, file=sys.stderr)]]
)
vcpkg_replace_string("${SOURCE_PATH}/pip_system_certs/bootstrap.py"
    [[print("pip_system_certs: ERROR: could not register module:", ex)]]
    [[print("pip_system_certs: ERROR: could not register module:", ex, file=sys.stderr)]]
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pip_system_certs")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
