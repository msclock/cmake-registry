vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  msclock/cmake-modules
  REF
  v${VERSION}
  SHA512
  27ad965f8a834712a46686577ecd8875d178537333bfdd5ead57f838dee99358d4fa98adfa8d1c3d5d6af4e784e9187a1a6c798697d7b3ca75431f2e3d8f7899
)

file(GLOB items ${SOURCE_PATH}/cmake/*)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
