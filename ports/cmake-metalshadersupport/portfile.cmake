vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  dpogue/CMake-MetalShaderSupport
  REF
  ${VERSION}
  SHA512
  d1ec5c3c46282db9961b074dc0f054d1baa0669e5df48a407011ed1cb2c6d7488b31660118a46fe2b01a4a695d445bc7165d4055760169b88164e0c85cc4c318
  HEAD_REF
  master)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENCE.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
