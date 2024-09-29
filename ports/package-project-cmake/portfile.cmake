vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  TheLartians/PackageProject.cmake
  REF
  v${VERSION}
  SHA512
  d13cc286f06af7231da28283fa4b0cb3ad42c033c37d32ed571dcc7f150b03a3b2fd2b2912bda031fe1a6d73ca846578f3d7c4af4d4b0e540cb9a798bd51ceac
)

file(RENAME ${SOURCE_PATH}/CMakeLists.txt ${SOURCE_PATH}/PackageProject.cmake)

set(items ${SOURCE_PATH}/PackageProject.cmake ${SOURCE_PATH}/version.h.in ${SOURCE_PATH}/Config.cmake.in)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
