vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  robotology/ycm
  REF
  v${VERSION}
  SHA512
  a1bb71295d1a2e0d6293dbcccfc245e0db15ce4d19093771d9363587c553651688e4799885f0afb4c6e16f5c6eab28e82f6d59caccd382051fcf8fae6defdc74
)

file(GLOB items ${SOURCE_PATH}/*)
list(FILTER items EXCLUDE REGEX
     "${SOURCE_PATH}/(deprecated|tests|LICENSES|\.reuse|\.github)")
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
