vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  cpm-cmake/CPM.cmake
  REF
  v${VERSION}
  SHA512
  cb3b2252926bf9e43497bfd3ac81ca3c487e2e98dba90c8b6c5347a1a4a37398832c138b51b530930f4beba4e24a2d42a5e299d630e131f7342f9015291dc86f
)

vcpkg_replace_string(${SOURCE_PATH}/cmake/CPM.cmake
                     [[1.0.0-development-version]] ${VERSION})

vcpkg_cmake_module(PATH_LIST ${SOURCE_PATH}/cmake/CPM.cmake)

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
