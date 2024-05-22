vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  msclock/cmake-modules
  REF
  v${VERSION}
  SHA512
  f22e01eec37509d69073217ffee405498cd21fd95a5368d113db4f9bcfc53077fc91f0cd6031f078197aa460eb521de114986b74f9a51ff72b52b3a520c25ce0
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
