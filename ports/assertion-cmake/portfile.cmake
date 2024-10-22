vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  threeal/assertion-cmake
  REF
  v${VERSION}
  SHA512
  1cf1e7d2f9c7e6e3ee93650a2a4904ea6d980ea075468de3e08350eaeb9c41365f9f0257681606d4544c88b674e1980135e339e0258a87b3034aec9930465d80
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
