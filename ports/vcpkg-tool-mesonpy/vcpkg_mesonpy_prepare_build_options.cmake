function(vcpkg_mesonpy_prepare_build_options)
    cmake_parse_arguments(PARSE_ARGV 0 arg
        ""
        "OUTPUT"
        "OPTIONS;OPTIONS_DEBUG;OPTIONS_RELEASE;LANGUAGES;ADDITIONAL_BINARIES;ADDITIONAL_NATIVE_BINARIES;ADDITIONAL_CROSS_BINARIES;ADDITIONAL_PROPERTIES"
    )

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