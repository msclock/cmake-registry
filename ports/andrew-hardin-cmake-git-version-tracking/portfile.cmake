vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  andrew-hardin/cmake-git-version-tracking
  REF
  ${VERSION}
  SHA512
  24a12c37c779f8499e4a65e7234424fed5aa1c6290ec955e9f44c3be4030d0768246e4f75e4996152bc7c135e6b73347564dce70b4032c8443ed992369f2f948
  HEAD_REF
  master)

vcpkg_cmake_module(
  PATH_LIST ${SOURCE_PATH}/git_watcher.cmake ${SOURCE_PATH}/git.h
  ${SOURCE_PATH}/git.c.in ${SOURCE_PATH}/CMakeLists.txt)

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
