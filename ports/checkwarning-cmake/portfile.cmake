vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  threeal/CheckWarning.cmake
  REF
  v${VERSION}
  SHA512
  1abbbdda06c54bcc860b8fa4230ba3019450361c8dce099f90d63c4526274507b72c5384bbadc359ce9b6d9c51ba9e00a47f92bd14c943b9ca69b57b4a57546c
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
