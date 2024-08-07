vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  rpavlik/cmake-modules
  REF
  ${VERSION}
  SHA512
  18d78bdc8a05d82063d7034974d7765ea8d5e9134c4234f44613ba0ad204d9cb258cf0ddd270f0d42fa7c179c6823413b8cd240ac6ff3323e700cbb07f3af3bd
  HEAD_REF
  main)

file(GLOB items ${SOURCE_PATH}/*)
list(FILTER items EXCLUDE REGEX "${SOURCE_PATH}/(reuse|LICENSES|module-docs)")
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE_1_0.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
