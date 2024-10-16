vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  python-cmake/pytest-cmake
  REF
  ${VERSION}
  SHA512
  c36aa1b77be4b8b94fe04462c2e98291e17e9eaa824b61b04cdd94677f648a1b5bbd030e484b3ef84c8a0681d2a91223f266bb90ee019999b93d1ea3a525f540
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
