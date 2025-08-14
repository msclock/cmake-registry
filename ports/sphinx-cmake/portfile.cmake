vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  python-cmake/sphinx-cmake
  REF
  ${VERSION}
  SHA512
  857ec64c277145cdd933824883a88aa539c7e31028f172cb32c18c8d937279d9d7267b8389e123ac7130b4d0831a8cc184416342e3c54809dd7419a673f1fcd1
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
