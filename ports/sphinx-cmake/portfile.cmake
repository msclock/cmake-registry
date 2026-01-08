vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  python-cmake/sphinx-cmake
  REF
  ${VERSION}
  SHA512
  887917f47414c91d85bb36591c79cd621c5e72db78e640a533957c7c36e4114124d3dfdea7294f0815f5161fdc0815c44d303774c098162c544c4187f47dcbe8
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
