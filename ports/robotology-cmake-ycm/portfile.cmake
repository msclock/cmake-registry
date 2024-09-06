vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  robotology/ycm
  REF
  v${VERSION}
  SHA512
  b53de2f06115c4f83111270085262c56cf10dc61152c01e9f030e93d9e64894dc14218e9d656a1eb9bf4a8d8d1695d5533cdbc2f99abd4957c0adf4870e5390f
)

file(GLOB items ${SOURCE_PATH}/*)
list(FILTER items EXCLUDE REGEX
     "${SOURCE_PATH}/(deprecated|tests|LICENSES|\.reuse|\.github)")
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
