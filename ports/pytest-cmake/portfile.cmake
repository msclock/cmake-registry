vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  python-cmake/pytest-cmake
  REF
  ${VERSION}
  SHA512
  d6a093177bc17feae5b271b447348bcdcd808bb409ac416970427285fcc8a39a0b55b29cd948f38a54e88a6c4b602821fc0d749be378a79af5c95a1201b269a0
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
