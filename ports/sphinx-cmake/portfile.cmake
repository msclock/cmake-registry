vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  python-cmake/sphinx-cmake
  REF
  ${VERSION}
  SHA512
  816125738fe6813fd148bff653a2d1714cdd7f04b2a322cb42e48bc93811778d8a66586eb7eeb2c854b8c164dc2424686cce430d959b751668bd24e353b18708
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
