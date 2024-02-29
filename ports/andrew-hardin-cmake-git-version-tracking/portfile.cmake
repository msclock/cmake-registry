vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  andrew-hardin/cmake-git-version-tracking
  REF
  ${VERSION}
  SHA512
  c35c3a75fc10fe65ee128bdecad9916e40eed419d69a3ef0c1512c9760569fdd378b00fd0a2d28ec82b5de92c36eadc8e6d518877aee3ca39a51440e03f0f3f3
  HEAD_REF
  master)

vcpkg_cmake_module(
  PATH_LIST ${SOURCE_PATH}/git_watcher.cmake ${SOURCE_PATH}/git.h
  ${SOURCE_PATH}/git.c.in ${SOURCE_PATH}/CMakeLists.txt)

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
