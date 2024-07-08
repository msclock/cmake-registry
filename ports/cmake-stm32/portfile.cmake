vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  ObKo/stm32-cmake
  REF
  ${VERSION}
  SHA512
  f0b1698014e6a2a595318d5f51a7b1a17b68a730e1d90b430f209a78ca43c0b70e67699d3f8b978d8ae43b2c5a38f04ec699199a86568ec646d67f4aa28a8bf4
  HEAD_REF
  master)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
