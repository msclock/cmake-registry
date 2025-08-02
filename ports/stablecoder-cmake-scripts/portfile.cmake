vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  StableCoder/cmake-scripts
  REF
  ${VERSION}
  SHA512
  9131fae71ea9ac4fee23f91fd1f3fa6b60332b918e355747dca3487ba75af07d1dbf0611b6b9fa7534c2eb1e855bf8ceaa2026929fc1c22559104bbb8839995a
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
