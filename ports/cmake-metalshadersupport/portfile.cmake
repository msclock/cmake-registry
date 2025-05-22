vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  dpogue/CMake-MetalShaderSupport
  REF
  ${VERSION}
  SHA512
  4bcfb418f82b9a948c29bfa532c47ed613b3652fdfbba53a187e4c362a88dcef1dc9b6df5daf52d4f6f58a439746e0e01636108bb1332f753856daa30ef6696b
  HEAD_REF
  master)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENCE.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
