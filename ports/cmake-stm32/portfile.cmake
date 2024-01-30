vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  ObKo/stm32-cmake
  REF
  ${VERSION}
  SHA512
  acfb50776bae3def55151d5db09552aa0ed2d394b8217ff729dd45551001d3b4b168cbfed08019e6bc2ac368c98794d22032561ac7a51a8a3d6b455223bc0986
  HEAD_REF
  master)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
