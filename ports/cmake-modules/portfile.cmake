vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  msclock/cmake-modules
  REF
  v${VERSION}
  SHA512
  3dcbda410f5ce85065205a0a698b05a8ebd153c0b46138368649964dddfb6a49615eeadbd0b19d750745ca5c12de81658319b23259a1ca11b37e7a016f95c005
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
