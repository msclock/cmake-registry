vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  aminya/project_options
  REF
  v${VERSION}
  SHA512
  4677b84f1006781ae68186bb7ae7edba628c2799ad9ccc72729114d5ddad279211c458e9e464d2a78f81796aa56b7cd0468db16401b1422f535abdb27fb19e03
)

file(GLOB items ${SOURCE_PATH}/src/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
