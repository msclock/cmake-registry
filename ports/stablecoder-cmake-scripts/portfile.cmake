vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  StableCoder/cmake-scripts
  REF
  ${VERSION}
  SHA512
  4ff97c7cfe7d6eec352ed92ab7a516bb62c9a10655f4bf98ab20ec5b9abb11a71bb5c3cec001bc35f2b650e5d38a95a780b27111b32ae6055795f16566838a37
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
