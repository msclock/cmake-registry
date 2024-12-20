vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  cpm-cmake/CPM.cmake
  REF
  v${VERSION}
  SHA512
  ba427bfbd971a8beb749f82855e888a41baafad6f1adcb289082d4296bc227ec34bb87c8ba5d6035f1fef78c76c603e21012a85767d0199199f90c034a6885ab
)

vcpkg_replace_string(${SOURCE_PATH}/cmake/CPM.cmake
                     [[1.0.0-development-version]] ${VERSION})

vcpkg_cmake_module(PATH_LIST ${SOURCE_PATH}/cmake/CPM.cmake)

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
