set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    trove-classifiers
    VERSION         ${VERSION}
    SHA512          460df4327866ea6ef19ea04e9ea4dd746eb733ceafec0db9920b1e6eb1649abfcc914f4e103700072696846c4af4c85003a1ef6323b4605a8f1659126d459503
    FILENAME        trove_classifiers
    FILENAME        trove_classifiers
    FILENAME        trove_classifiers
    FILENAME        trove_classifiers
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "trove_classifiers")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
