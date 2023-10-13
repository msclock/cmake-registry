vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  rpavlik/cmake-modules
  REF
  d66fc5dec3eaea3a4f9778ceeeb65cbec490b5b9
  SHA512
  890c7571645b5791fa5be838d21681806f58c246ee11c6b1c427ec322ab6dbd867945b4b78fb34d02963b8ef2d47c7b309887f8ddeb4fc7294b71226abfeb1cf
  HEAD_REF
  main)

file(GLOB items ${SOURCE_PATH}/*)
list(FILTER items EXCLUDE REGEX [[reuse|LICENSES|module-docs]])
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE_1_0.txt)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
