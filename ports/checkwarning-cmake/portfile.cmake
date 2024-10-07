vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  threeal/CheckWarning.cmake
  REF
  v${VERSION}
  SHA512
  8b577ee0ef60d913f291892ee43ded0dfadf21113308c5f3d66f08021374bb17de55a0ddd4e932fb2feaad1ffd70521d8309d357613ae9f6e0c0ece143f06533
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
