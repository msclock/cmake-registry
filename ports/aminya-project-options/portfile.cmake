vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  aminya/project_options
  REF
  v${VERSION}
  SHA512
  a84e2818cc152e76136b709a6dd68450c101bc97c08b57b6dff72e308a33b0406ad379fe268db52921f19487399dc26ee30c0066237694d2865417cf601ea087
)

file(GLOB items ${SOURCE_PATH}/src/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
