vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  cpm-cmake/CPM.cmake
  REF
  v${VERSION}
  SHA512
  c37a3b80b8502e5ce947446b86aa4d9c4c909906ad86f3c910b3c3e08d4ff2fd38f80c5c6b8373e9fb7378ac51eec378c5ce2ff715d1531b1477bdeed9f6490f
)

vcpkg_replace_string(${SOURCE_PATH}/cmake/CPM.cmake
                     [[1.0.0-development-version]] ${VERSION})

vcpkg_cmake_module(PATH_LIST ${SOURCE_PATH}/cmake/CPM.cmake)

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
