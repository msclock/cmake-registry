vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  rpavlik/cmake-modules
  REF
  ${VERSION}
  SHA512
  38df4516f3fce70326462e2b2382070240a7b3df7fb44b994bbd1f9e11a58c3f1f04f9b0c1e4663ae3902422efd13ff9bd7af039dbf6f26f578f590d36498ef2
  HEAD_REF
  main)

file(GLOB items ${SOURCE_PATH}/*)
list(FILTER items EXCLUDE REGEX [[reuse|LICENSES|module-docs]])
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE_1_0.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
