vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  robotology/ycm
  REF
  v${VERSION}
  SHA512
  d7e137bc542adba3466d96709c21b0c267c5627014f5c91731c76da70241bc20365db8934a4eae840eae5080bf96a3e0ff8031916ba72f27e7c0e673fdd185cf
)

file(GLOB items ${SOURCE_PATH}/*)
list(FILTER items EXCLUDE REGEX
     "${SOURCE_PATH}/(deprecated|tests|LICENSES|\.reuse|\.github)")
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
