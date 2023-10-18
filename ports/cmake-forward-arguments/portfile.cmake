vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  polysquare/cmake-forward-arguments
  REF
  v${VERSION}
  SHA512
  493a1eb1cd09388d2b6119a2b1d0dd66e0ce8da1471188f121e6d6364ffd6e2a8ba705de2f8f66207f53e41b9650f90cbcbf0b1d658372d0c3b30cf420b8ae49
)

vcpkg_cmake_module(PATH_LIST ${SOURCE_PATH}/ForwardArguments.cmake)

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENCE.md)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
