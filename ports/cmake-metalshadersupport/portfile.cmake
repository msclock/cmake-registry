vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  dpogue/CMake-MetalShaderSupport
  REF
  ${VERSION}
  SHA512
  4b75f7184e66eb929563adcfbb8cb7586579bfb456c8183e69742cc2bcba046b8e2ecacd862c48206491ce5bffed2d24ee38f83e5b42f30d342052d117799ded
  HEAD_REF
  master)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENCE.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
