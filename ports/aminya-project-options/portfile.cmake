vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  aminya/project_options
  REF
  v${VERSION}
  SHA512
  edaa9a78c30437928864cb16a6e78b1dec3bb77f4484970eb329aa736f31464f86ed9eed013a42b18c149a3490ea55af1671e5d9c2b37c534d5cf0cf054eae65
)

file(GLOB items ${SOURCE_PATH}/src/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
