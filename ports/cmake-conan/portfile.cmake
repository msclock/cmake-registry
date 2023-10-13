vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  conan-io/cmake-conan
  REF
  ${VERSION}
  SHA512
  29ccceaa0b7fe42b0c4a5f6e5ecb6579753e39371642860c93362aa14302a00081eaff348f7b0e3f3b1cfd39e530e0f4f3a5a7c0662bbdf81030b5fb352678d3
)

vcpkg_cmake_module(PATH_LIST ${SOURCE_PATH}/conan.cmake)

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
