vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  threeal/assertion-cmake
  REF
  v${VERSION}
  SHA512
  d65e415c276841465634da6a07a5f952bc59af2d6150f605efffc6c50b59b52dbc0edb59ffde2e6d796629d0db216f7d8b855dc053a2bf0c21e3472fad1a5a1b
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
