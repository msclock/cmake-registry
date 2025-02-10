vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  rpavlik/cmake-modules
  REF
  ${VERSION}
  SHA512
  736b0315de3acec0a90882f1e3fc62489f9ee3ac04b65c70c3435dba9a03ff9dd1bc16022c026d52a948cbe609a1bad89011bb866d8ab506faad52fa01b8ae00
  HEAD_REF
  main)

file(GLOB items ${SOURCE_PATH}/*)
list(FILTER items EXCLUDE REGEX "${SOURCE_PATH}/(reuse|LICENSES|module-docs)")
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE_1_0.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
