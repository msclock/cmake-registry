vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  vector-of-bool/cmrc
  REF
  ${VERSION}
  SHA512
  e00ff1a4166f62f66effe324551f3c3225a7bf0416a693ca39b1d04fdf696c162466da18718b2c44f84227c17e82fa6ca50882d28bfd6e0147fa6741008e58e5
  HEAD_REF
  master)

vcpkg_cmake_module(PATH_LIST ${SOURCE_PATH}/CMakeRC.cmake)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
