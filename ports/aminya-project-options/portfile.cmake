vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  aminya/project_options
  REF
  v${VERSION}
  SHA512
  673084cb802fdf5d23b908241f8227685392bb668c618f3646be5ce47d4db3cbc86c8aa09ef93a699d9704483d980208e1d625bd1452fe532cb1566c050deb66
)

file(GLOB items ${SOURCE_PATH}/src/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
