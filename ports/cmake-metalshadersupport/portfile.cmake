vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  dpogue/CMake-MetalShaderSupport
  REF
  ${VERSION}
  SHA512
  26764a9527742bb705bfac057f5dd3e1f0a3da4ca147e6625c24c59cb5c0cdcb7065fef585a360bd276b955b49e4b2ea06dc25bb57d680675bcebe1c1db67417
  HEAD_REF
  master)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENCE.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
