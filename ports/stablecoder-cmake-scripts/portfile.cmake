vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  StableCoder/cmake-scripts
  REF
  ${VERSION}
  SHA512
  6a264344a3138031e163eba02cba2253f012450386b4675a32e96dc216ed22540ad708f0bbfab63eddc2f78b281021f46d528b46f32c697da3caa96a49a18c25
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
