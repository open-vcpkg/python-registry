set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    narwhals
    VERSION         ${VERSION}
    SHA512          225190b5e31f3fd5ac514527bd8dcb3c50ae7f4abd3620ae1cf5a28b5f88b5c115b590705eb3c63de97dd8c5e172fd892286c3f896439815a3a83c076c18b3ba
)

# uv_build is not available, build with hatchling instead
# (matched by regex so that upstream bumping the uv_build version range does not break this)
vcpkg_replace_string("${SOURCE_PATH}/pyproject.toml"
    "requires = \\[\"uv_build[^\n]*\nbuild-backend = \"uv_build\""
    "requires = [\"hatchling\"]\nbuild-backend = \"hatchling.build\"\n\n[tool.hatch.build.targets.wheel]\npackages = [\"src/narwhals\"]"
    REGEX
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

vcpkg_python_test_import(MODULE "narwhals")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
