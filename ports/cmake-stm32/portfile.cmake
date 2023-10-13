vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  ObKo/stm32-cmake
  REF
  9b5d77ca0d8731ab2891aa17ef18a143ef90eef2
  SHA512
  18c63c8762d19255bbda099b4f7c4acbe1b0e7e67b9e04f3670bf3335be139dc3729633337af78bded0b2f01983bee6d9b9fe81468f1011153ab2e0e8fea3d5a
  HEAD_REF
  master)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
