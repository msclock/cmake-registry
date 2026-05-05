vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  cpm-cmake/CPM.cmake
  REF
  v${VERSION}
  SHA512
  865ac85a23847df73ae84c75788ccd063d4a0a84a1c3facb078e8d98648439ab10fe51d21bf9cc38f5a717a4edef19ea40db883b12b1ceb7068ba1e148378dc0
)

vcpkg_replace_string(${SOURCE_PATH}/cmake/CPM.cmake
                     [[1.0.0-development-version]] ${VERSION})

vcpkg_cmake_module(PATH_LIST ${SOURCE_PATH}/cmake/CPM.cmake)

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
