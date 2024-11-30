vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  robotology/ycm
  REF
  v${VERSION}
  SHA512
  e4053bb4192b6e2a7e7489120c67fcf6d988612755b1f9381f9bd5287592f9c15315791a55dbd5a19945ddfdd0298a8ee8690e6772a41d0591ffd9c46ac66924
)

file(GLOB items ${SOURCE_PATH}/*)
list(FILTER items EXCLUDE REGEX
     "${SOURCE_PATH}/(deprecated|tests|LICENSES|\.reuse|\.github)")
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
