vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  cpm-cmake/CPM.cmake
  REF
  v${VERSION}
  SHA512
  1c750dc78dc7fbb85a09105c4353c48ac5c3d688cb84431feb0d2358471861f9c80249be26f991de13c7eb4d0f613ea232e56964f14b6dad34aa887c99636d5b
)

vcpkg_replace_string(${SOURCE_PATH}/cmake/CPM.cmake
                     [[1.0.0-development-version]] ${VERSION})

vcpkg_cmake_module(PATH_LIST ${SOURCE_PATH}/cmake/CPM.cmake)

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
