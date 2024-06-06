vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  python-cmake/sphinx-cmake
  REF
  ${VERSION}
  SHA512
  cfa02257698e65c83ef031aafd86c44fa5fae7d8b51c3d68347ae39829f562ac53bb60675dad5e277248923d57069157380d8589afb6e9206cab8b7867a72ed8
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
