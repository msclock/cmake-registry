vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  scivision/cmake-patch-file
  REF
  v${VERSION}
  SHA512
  deb772cb5c3f2e1d737fd82e52eb6016624f0ffc88a74926e329b8fd149d0e39e866d0744c6848169eb1980d3373d68185fb7bfe24240f16e9725279ededb6d2
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
