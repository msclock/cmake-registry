vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  python-cmake/sphinx-cmake
  REF
  ${VERSION}
  SHA512
  1c61e77eccfb47b9f4af388e8bd325d7b6b8c04595f99c6a96f369bf50bedda80b77fb8d5ec49085e137f9765476bdc974a607b286a44cd6a3709facfc4b1324
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
