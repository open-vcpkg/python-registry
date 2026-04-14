# Overwrite builtin scripts
include("${CMAKE_CURRENT_LIST_DIR}/../vcpkg-tool-meson/vcpkg-port-config.cmake")

if (PYTHON3_BUILD_VENV)
    file(INSTALL "${SCRIPT_MESON}" DESTINATION "${PYTHON3_BUILD_VENV}/${PYTHON3_SITE}")
    unset(SCRIPT_MESON)
    unset(SCRIPT_MESON CACHE)
    set(SCRIPT_MESON "${PYTHON3_BUILD_VENV}/${PYTHON3_SITE}/meson.py")
endif()
set(ENV{MESON} "${SCRIPT_MESON}")
message(STATUS "Using meson: ${SCRIPT_MESON}")

include("${CMAKE_CURRENT_LIST_DIR}/vcpkg_mesonpy_prepare_build_options.cmake")
