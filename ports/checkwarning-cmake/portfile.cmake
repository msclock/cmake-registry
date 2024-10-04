vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  threeal/CheckWarning.cmake
  REF
  v${VERSION}
  SHA512
  d30ee36f4bfd730845bc944a6b3817af2278ca83fe8fd85c1988d03c961068a13682c964e35be3b808322a347c1c890c9946f3a11d536200e28d4e7c4020bf07
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
