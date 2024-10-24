vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  threeal/CheckWarning.cmake
  REF
  v${VERSION}
  SHA512
  744d750ed62ede0c2d57ccc7b93e359db7601de46cd1344c778df393329954bdf110b6b1af65958f7b3e3f67bde635c478dcd9d4bf409e12412faf7df605ea0c
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
