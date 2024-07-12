vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  threeal/assertion-cmake
  REF
  v${VERSION}
  SHA512
  7d7c6ed73386099cfbb0a33e569f0eaf801600ec254141cccbe3d13c2fbc80020e029ab47ba5c68f7bfab2b7dc7bfeb103a5dc1e8794b4092dca80ee037553dd
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
