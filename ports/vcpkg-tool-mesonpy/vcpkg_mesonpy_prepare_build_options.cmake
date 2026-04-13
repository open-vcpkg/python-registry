function(vcpkg_mesonpy_prepare_build_options)
    cmake_parse_arguments(PARSE_ARGV 0 arg
        ""
        "OUTPUT"
        "OPTIONS;OPTIONS_DEBUG;OPTIONS_RELEASE;LANGUAGES;ADDITIONAL_BINARIES;ADDITIONAL_NATIVE_BINARIES;ADDITIONAL_CROSS_BINARIES;ADDITIONAL_PROPERTIES"
    )
    
    if (PYTHON3_BUILD_VENV)
        file(INSTALL "${SCRIPT_MESON}" DESTINATION "${PYTHON3_BUILD_VENV}/${PYTHON3_SITE}")
        unset(SCRIPT_MESON)
        unset(SCRIPT_MESON CACHE)
        set(SCRIPT_MESON "${PYTHON3_BUILD_VENV}/${PYTHON3_SITE}/meson.py")
    endif()
    set(ENV{MESON} "${SCRIPT_MESON}")
    message(STATUS "Using meson: ${SCRIPT_MESON}")

    vcpkg_generate_meson_cmd_args(
        OUTPUT meson_opts
        CONFIG RELEASE
        OPTIONS ${arg_OPTIONS}
        LANGUAGES ${arg_LANGUAGES}
        ADDITIONAL_BINARIES ${arg_ADDITIONAL_BINARIES}
        ADDITIONAL_PROPERTIES ${arg_ADDITIONAL_PROPERTIES}
    )

    set("${arg_OUTPUT}" ${meson_opts} ${arg_OPTIONS_RELEASE} PARENT_SCOPE)
endfunction()