vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  StableCoder/cmake-scripts
  REF
  ${VERSION}
  SHA512
  bb27c23adde569f3d2bcf5620b149381281496782072ff544c37b6bca6265a9936f1e82b41483a77d2efa3a2178cd3b9b5a12bb40e71257598e27388db4d91d6
  HEAD_REF
  main)

file(GLOB items ${SOURCE_PATH}/*)
list(FILTER items EXCLUDE REGEX
     [[LICENSE|.gitlab-ci.yml|.clang-format|img|example|.gitignore]])
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
