vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  msclock/cmake-modules
  REF
  v${VERSION}
  SHA512
  42a24ea44b17e6e7cfc4b9464c5403332bcdbb2bf464ef6aa6cc5e9fa72be065303df1b7060c19073f3d48fcf2ac9ff387aebeea0fdbb86863b3577e17177258
)

vcpkg_cmake_module(DIRECTORY_LIST ${SOURCE_PATH}/cmake/)

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
