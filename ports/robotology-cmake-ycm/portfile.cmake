vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  robotology/ycm
  REF
  v${VERSION}
  SHA512
  d033a4880204fde2335668e2881580e1951269205713386b1ca4ef0509b9d6160bc9e802f29c5a3ed93ff777066d8c63bf49d9a6db29e7ecd3b4ddd812e4207b
)

file(GLOB items ${SOURCE_PATH}/*)
list(FILTER items EXCLUDE REGEX [[deprecated|tests|LICENSES|.reuse|.github]])
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
