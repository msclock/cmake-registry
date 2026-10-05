vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  StableCoder/cmake-scripts
  REF
  ${VERSION}
  SHA512
  3137d9bef72dfcd4c5d364633f88680b469e6163a4fded8d6e06aa9d2188be1accf49ded0b2a167478ebfa82d70d204344c6ce60f57425c841cb5d07c66477c9
  HEAD_REF
  main)

file(GLOB items ${SOURCE_PATH}/*)
list(
  FILTER
  items
  EXCLUDE
  REGEX
  "${SOURCE_PATH}/(LICENSE|\.gitlab-ci\.yml|\.clang-format|img|example|\.gitignore)"
)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
