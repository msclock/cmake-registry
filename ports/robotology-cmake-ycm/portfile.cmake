vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  robotology/ycm
  REF
  v${VERSION}
  SHA512
  2f71f076a2d3461b92543b4fe3966fbca4e48f1189e69b8246cc2fb7074871899247557ee6892d09abc291364879b7c2498e13fb2ec636e46e2218171d503bea
)

file(GLOB items ${SOURCE_PATH}/*)
list(FILTER items EXCLUDE REGEX [[deprecated|tests|LICENSES|.reuse|.github]])
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
