set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    narwhals
    VERSION         ${VERSION}
    SHA512          0b34db6afceb7858f219fe6b65a755e61240943566819b32fff89406a550a17bf4ef5354454ed6753053ccc56bee95fd7ae9049aab7d0e025df8d87d4539d6ad
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
