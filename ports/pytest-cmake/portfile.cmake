vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  python-cmake/pytest-cmake
  REF
  ${VERSION}
  SHA512
  1b8e0237d42ca9d1b688be26f33e22dce8c23e35f6d73a100706e2a3a992c502d4ca899b55e4fbe1cbd06bd9a4c0da3447e55236049dcc287d82ec9b3fcf8c3e
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
