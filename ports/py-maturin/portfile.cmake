vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    maturin
    VERSION         ${VERSION}
    SHA512          0bc0de6e8cf8976b40d2f656309d78f22c2d22e37b72b5d28bb5e85d2b0a3830175e88b66eabfa6e39bbddc886a426387b1d2b65fdc8838f0b5207d887ea9893
)

vcpkg_get_rust(CARGO)
cmake_path(GET CARGO PARENT_PATH CARGO_BIN_DIR)
vcpkg_add_to_path("${CARGO_BIN_DIR}")

vcpkg_install_python_build_dependency(
    PACKAGE "setuptools-rust"
    VERSION 1.12.1
    HASHES
        "sha256:85ae70989d96c9cfeb5ef79cf3bac2d5200bc5564f720a06edceedbdf6664640"
        "sha256:b7ebd6a182e7aefa97a072e880530c9b0ec8fcca8617e0bb8ff299c1a064f693"
    
)
vcpkg_install_python_build_dependency(
    PACKAGE "semantic-version==2.10.0"
    HASHES
        "sha256:bdabb6d336998cbb378d4b9db3a4b56a1e3235701dc05ea2690d9a997ed5041c"
        "sha256:de78a3b8e0feda74cabc54aab2da702113e33ac9d9eb9d2389bcf1f58b7d9177"
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/license-apache")
vcpkg_python_test_import(MODULE "maturin")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
