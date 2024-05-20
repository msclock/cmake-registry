vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  robotology/ycm
  REF
  v${VERSION}
  SHA512
  ff9c80b5367beb9d04d80bdea8000be8abbf6c7b1f89ce78cb78689c82fdef9fe486425c35971244b8b42b30937ee6081643f04157f6ea319583ff292ab43345
)

file(GLOB items ${SOURCE_PATH}/*)
list(FILTER items EXCLUDE REGEX
     "${SOURCE_PATH}/(deprecated|tests|LICENSES|\.reuse|\.github)")
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
