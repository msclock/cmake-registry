vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  dpogue/CMake-MetalShaderSupport
  REF
  ${VERSION}
  SHA512
  37d217f021be5e77e37409ef5082fe0cd34701c21160825aa628c8379c7f72399ec324e5e35f47b0fd9f982e52f9d6871008df7414e8fa6c9f0e72f57271823a
  HEAD_REF
  master)


file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENCE.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
