vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  msclock/cmake-modules
  REF
  v${VERSION}
  SHA512
  136fcd788fe98cccf3b3500ae16d07d84fef7d59293327d3c84f1f466bea8c504338ba253f1ac7c146c0c5137d6a004b21726810d88d8ece34e10cd1c0b6c81c
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
