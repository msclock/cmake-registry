vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  ObKo/stm32-cmake
  REF
  ${VERSION}
  SHA512
  5d060dffe36500c622b53aeffeb3b7b031a2b8c2862ed0527352a71e8e78a413493dce12147d2f30bdfcc338720b5b05f537a4bc18561b5b3874661c5dc7505b
  HEAD_REF
  master)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
