vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  ObKo/stm32-cmake
  REF
  ${VERSION}
  SHA512
  27e9977b4dbc40db541a5f0a80e916809c3b9d733e585e368f67f1a8238baa8aa534a08fadadd43df0c41110d0aa21593d588078214228782a3fa5f4d97bdb40
  HEAD_REF
  master)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
