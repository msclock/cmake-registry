vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  threeal/CheckWarning.cmake
  REF
  v${VERSION}
  SHA512
  6a1f2e9c9cdddb15d2afdd1016d0b84b3a740fbb84a78afb30615b801f302aa04771f7535fddbf4f68df07ac1d85dd4668c907d226db8986014a5311b472b21a
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
