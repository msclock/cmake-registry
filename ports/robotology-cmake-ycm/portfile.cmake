vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  robotology/ycm
  REF
  v${VERSION}
  SHA512
  1057493d555edacbca440535907104b8cd0ad302489332fbbffb5f714e02c61bab9c4013cf9034f4110e33ce42cef8837d992c92bb0c1d2757fd676e3fd2a170
)

file(GLOB items ${SOURCE_PATH}/*)
list(FILTER items EXCLUDE REGEX [[deprecated|tests|LICENSES|.reuse|.github]])
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
