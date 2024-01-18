vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  aminya/project_options
  REF
  v${VERSION}
  SHA512
  0f00758b8a8c1ed522aed80b6decf6712cbf39b8f900f2b5445b53388944c2ed449d466b5d93bcd308f8497ca5d43287fc664d4efac486e2acfeec4f9e654ab6
)

file(GLOB items ${SOURCE_PATH}/src/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
