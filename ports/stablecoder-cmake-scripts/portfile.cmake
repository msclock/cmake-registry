vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  StableCoder/cmake-scripts
  REF
  ${VERSION}
  SHA512
  39ef0efaf901ec676e617e39cd7bb8b8ed93f5b334a8cd07a77de1ddebb0f20c58acf5fd4db2d04f0cd8e3cebbe4181a68b2d40654140fd1965e0e8e14e72d7d
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
