function(vcpkg_get_rust OUT)
    set(version "1.82.0")
    set(tool_name "cargo")
    set(tool_subdirectory "rust-${version}-x64")
    set(download_urls "https://sh.rustup.rs")
    set(download_filename "rustup-${version}-x64")
    set(download_sha512 bece2dfa6889f3ac4de782e51543cf18112130092d50d270c86ffcd5f6e62636d39077dffd71ed7df59e7fa8123f5746d0558783f86246ca2cee8c24ecb07545)
    
    set(tool_path "${DOWNLOADS}/tools/${tool_subdirectory}")

    find_program(CARGO NAMES "${tool_name}" PATHS "${DOWNLOADS}/tools/${tool_path}/bin")

    set(ENV{RUSTUP_HOME} "${tool_path}")
    set(ENV{CARGO_HOME} "${tool_path}")

    if(NOT RUST)
        vcpkg_download_distfile(rustup_path
            URLS ${download_urls}
            SHA512 "${download_sha512}"
            FILENAME "${download_filename}"
        )

        if (VCPKG_TARGET_IS_WINDOWS AND NOT VCPKG_TARGET_IS_MINGW)
            vcpkg_acquire_msys(MSYS_ROOT PACKAGES)
            vcpkg_add_to_path("${MSYS_ROOT}/usr/bin")
        endif()

        file(MAKE_DIRECTORY "${tool_path}")
        message(STATUS "Running rustup ...")
        vcpkg_execute_in_download_mode(
                        COMMAND "${MSYS_ROOT}/usr/bin/bash" -c "${rustup_path} -y --profile minimal --default-toolchain=${version}"
                        WORKING_DIRECTORY "${tool_path}" 
                        OUTPUT_FILE "${CURRENT_BUILDTREES_DIR}/rustup-${TARGET_TRIPLET}-out.log"
                        ERROR_FILE "${CURRENT_BUILDTREES_DIR}/rustup-${TARGET_TRIPLET}-err.log"
                        RESULT_VARIABLE error_code
                    )
        if(error_code)
            message(FATAL_ERROR "Couldn't install rust with rustup!")
        endif()
        message(STATUS "Installing rust ... finished!")
        set(CARGO "${tool_path}/bin/cargo.exe")
    endif()

    set(${OUT} "${CARGO}" PARENT_SCOPE)
endfunction()
