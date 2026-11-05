function(vcpkg_mesonpy_prepare_build_options)
    cmake_parse_arguments(PARSE_ARGV 0 arg
        ""
        "OUTPUT"
        "OPTIONS;OPTIONS_DEBUG;OPTIONS_RELEASE;LANGUAGES;ADDITIONAL_BINARIES;ADDITIONAL_NATIVE_BINARIES;ADDITIONAL_CROSS_BINARIES;ADDITIONAL_PROPERTIES"
    )
    if(NOT arg_LANGUAGES)
        set(arg_LANGUAGES C CXX)
    endif()
    if(NOT VCPKG_CHAINLOAD_TOOLCHAIN_FILE)
        z_vcpkg_select_default_vcpkg_chainload_toolchain()
    endif()
    # vcpkg_cmake_get_vars sets the VCPKG_COMBINED_* flags (e.g. -arch) which vcpkg-tool-meson writes to the cross/native file
    vcpkg_cmake_get_vars(cmake_vars_file ADDITIONAL_LANGUAGES ${arg_LANGUAGES})
    debug_message("Including cmake vars from: ${cmake_vars_file}")
    include("${cmake_vars_file}")

    set(ENV{MESON} "${SCRIPT_MESON}")

    get_filename_component(CMAKE_PATH "${CMAKE_COMMAND}" DIRECTORY)
    vcpkg_add_to_path("${CMAKE_PATH}") # Make CMake invokeable for Meson

    vcpkg_find_acquire_program(NINJA)
    get_filename_component(NINJA_PATH ${NINJA} DIRECTORY)
    vcpkg_add_to_path(PREPEND "${NINJA_PATH}") # Prepend to use the correct ninja.

    vcpkg_find_acquire_program(PYTHON3)
    get_filename_component(PYTHON3_DIR "${PYTHON3}" DIRECTORY)
    vcpkg_add_to_path(PREPEND "${PYTHON3_DIR}")

    set(buildname "RELEASE")
    vcpkg_list(APPEND buildtypes "${buildname}")
    set(path_suffix_${buildname} "")
    set(suffix_${buildname} "rel")
    set(meson_input_file_${buildname} "${CURRENT_BUILDTREES_DIR}/meson-${TARGET_TRIPLET}-${suffix_${buildname}}.log")

    vcpkg_list(APPEND arg_OPTIONS --backend ninja --wrap-mode nodownload -Dbuildtype=plain -Doptimization=plain)

    z_vcpkg_get_build_and_host_system(MESON_HOST_MACHINE MESON_BUILD_MACHINE IS_CROSS)

    # The two machine variable names are swapped (as in vcpkg-tool-meson), so match the [build_machine] section itself
    if(IS_CROSS AND VCPKG_TARGET_IS_OSX AND VCPKG_TARGET_ARCHITECTURE STREQUAL "x64"
       AND "${MESON_HOST_MACHINE}${MESON_BUILD_MACHINE}" MATCHES "\\[build_machine\\][^[]*cpu_family = 'aarch64'")
        # arm64 macOS runs x86_64 binaries (Rosetta), as scripts/toolchains/osx.cmake assumes for CMake
        vcpkg_list(APPEND arg_ADDITIONAL_PROPERTIES "needs_exe_wrapper = false")
    endif()
    vcpkg_list(JOIN arg_ADDITIONAL_BINARIES "\n" MESON_ADDITIONAL_BINARIES)
    vcpkg_list(JOIN arg_ADDITIONAL_PROPERTIES "\n" MESON_ADDITIONAL_PROPERTIES)

    if(IS_CROSS)
        # VCPKG_CROSSCOMPILING is not used since it regresses a lot of ports in x64-windows-x triplets
        # For consistency this should proably be changed in the future?
        vcpkg_list(APPEND arg_OPTIONS --native "${SCRIPTS}/buildsystems/meson/none.txt")
        vcpkg_list(APPEND arg_OPTIONS_DEBUG --cross "${meson_input_file_DEBUG}")
        vcpkg_list(APPEND arg_OPTIONS_RELEASE --cross "${meson_input_file_RELEASE}")
    else()
        vcpkg_list(APPEND arg_OPTIONS_DEBUG --native "${meson_input_file_DEBUG}")
        vcpkg_list(APPEND arg_OPTIONS_RELEASE --native "${meson_input_file_RELEASE}")
    endif()

    # User provided cross/native files
    if(VCPKG_MESON_NATIVE_FILE)
        vcpkg_list(APPEND arg_OPTIONS_RELEASE --native "${VCPKG_MESON_NATIVE_FILE}")
    endif()
    if(VCPKG_MESON_NATIVE_FILE_RELEASE)
        vcpkg_list(APPEND arg_OPTIONS_RELEASE --native "${VCPKG_MESON_NATIVE_FILE_RELEASE}")
    endif()
    if(VCPKG_MESON_NATIVE_FILE_DEBUG)
        vcpkg_list(APPEND arg_OPTIONS_DEBUG --native "${VCPKG_MESON_NATIVE_FILE_DEBUG}")
    endif()
    if(VCPKG_MESON_CROSS_FILE)
        vcpkg_list(APPEND arg_OPTIONS_RELEASE --cross "${VCPKG_MESON_CROSS_FILE}")
    endif()
    if(VCPKG_MESON_CROSS_FILE_RELEASE)
        vcpkg_list(APPEND arg_OPTIONS_RELEASE --cross "${VCPKG_MESON_CROSS_FILE_RELEASE}")
    endif()
    if(VCPKG_MESON_CROSS_FILE_DEBUG)
        vcpkg_list(APPEND arg_OPTIONS_DEBUG --cross "${VCPKG_MESON_CROSS_FILE_DEBUG}")
    endif()

    if(VCPKG_LIBRARY_LINKAGE STREQUAL "dynamic")
        set(MESON_DEFAULT_LIBRARY shared)
    else()
        set(MESON_DEFAULT_LIBRARY static)
    endif()

    vcpkg_list(APPEND arg_OPTIONS --libdir lib) # else meson install into an architecture describing folder
    vcpkg_list(APPEND arg_OPTIONS_DEBUG -Ddebug=true --prefix "${CURRENT_PACKAGES_DIR}/debug" --includedir ../include)
    vcpkg_list(APPEND arg_OPTIONS_RELEASE -Ddebug=false --prefix "${CURRENT_PACKAGES_DIR}")

    # select meson cmd-line options
    if(VCPKG_TARGET_IS_WINDOWS)
        vcpkg_list(APPEND arg_OPTIONS_DEBUG "-Dcmake_prefix_path=['${CURRENT_INSTALLED_DIR}/debug','${CURRENT_INSTALLED_DIR}/share']")
        vcpkg_list(APPEND arg_OPTIONS_RELEASE "-Dcmake_prefix_path=['${CURRENT_INSTALLED_DIR}','${CURRENT_INSTALLED_DIR}/share']")
    else()
        vcpkg_list(APPEND arg_OPTIONS_DEBUG "-Dcmake_prefix_path=['${CURRENT_INSTALLED_DIR}/debug','${CURRENT_INSTALLED_DIR}']")
        vcpkg_list(APPEND arg_OPTIONS_RELEASE "-Dcmake_prefix_path=['${CURRENT_INSTALLED_DIR}']")
    endif()

    # Allow overrides / additional configuration variables from triplets
    if(DEFINED VCPKG_MESON_CONFIGURE_OPTIONS)
        vcpkg_list(APPEND arg_OPTIONS ${VCPKG_MESON_CONFIGURE_OPTIONS})
    endif()
    if(DEFINED VCPKG_MESON_CONFIGURE_OPTIONS_RELEASE)
        vcpkg_list(APPEND arg_OPTIONS_RELEASE ${VCPKG_MESON_CONFIGURE_OPTIONS_RELEASE})
    endif()
    if(DEFINED VCPKG_MESON_CONFIGURE_OPTIONS_DEBUG)
        vcpkg_list(APPEND arg_OPTIONS_DEBUG ${VCPKG_MESON_CONFIGURE_OPTIONS_DEBUG})
    endif()

    # configure build
    foreach(buildtype IN LISTS buildtypes)
        message(STATUS "Configuring ${TARGET_TRIPLET}-${suffix_${buildtype}}")
        file(MAKE_DIRECTORY "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-${suffix_${buildtype}}")
        #setting up PKGCONFIG
        if(NOT arg_NO_PKG_CONFIG)
            z_vcpkg_setup_pkgconfig_path(CONFIG "${buildtype}")
        endif()

        z_vcpkg_meson_setup_variables(${buildtype})
        configure_file("${CMAKE_CURRENT_FUNCTION_LIST_DIR}/../vcpkg-tool-meson/meson.template.in" "${meson_input_file_${buildtype}}" @ONLY)

        message(STATUS "Configuring ${TARGET_TRIPLET}-${suffix_${buildtype}} done")

        if(NOT arg_NO_PKG_CONFIG)
            z_vcpkg_restore_pkgconfig_path()
        endif()
    endforeach()

    set("${arg_OUTPUT}" ${arg_OPTIONS} ${arg_OPTIONS_RELEASE} PARENT_SCOPE)
endfunction()