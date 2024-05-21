vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  msclock/cmake-modules
  REF
  v${VERSION}
  SHA512
  eae061e4fc0ecb8be06670271280fa214ad13fd3dced3ce412908f2c1e2b606fe2092bae3455e498de703cd3a417eb519463c34200419994e1e98e18cd6a8299
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
