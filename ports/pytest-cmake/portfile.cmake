vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  python-cmake/pytest-cmake
  REF
  ${VERSION}
  SHA512
  71144480d8bf86b1e0b8f82056547b4ec415c0d274805e636745ca594fae45afa418a50d929b30d5f4996e3610e28f7fd91ff5f66a2a4315ea8ff608816beb9d
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
