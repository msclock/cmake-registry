vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  ObKo/stm32-cmake
  REF
  ${VERSION}
  SHA512
  6f99ba560ac211778b5b9c85ec59834653f909cb864b020e4b8e7f89ceb86d1bf55ec63db6c8d8231670beaabcb432c042d75a85d1faa8e62d2df5eba3133d34
  HEAD_REF
  master)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
