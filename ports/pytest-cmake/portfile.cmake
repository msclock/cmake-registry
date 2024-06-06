vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  python-cmake/pytest-cmake
  REF
  ${VERSION}
  SHA512
  bf1e314b7d708bfd066de7cee8542e3292924b5a49f1b3e3643cb834836f858b07bde198eda09c451738be0c01cbc0114274c32294cd8dc05f9eadf2947e1276
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
