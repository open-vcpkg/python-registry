set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    narwhals
    VERSION         ${VERSION}
    SHA512          39f9273e785565b39aa4e34602e7484002dd515deb47ce457d48f1365b047bcd8c53cf66f8cd6ada024a9937b2224de6f8037b1beb8340c07317667fe7e54076
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
