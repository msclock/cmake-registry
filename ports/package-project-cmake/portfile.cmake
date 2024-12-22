vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  TheLartians/PackageProject.cmake
  REF
  v${VERSION}
  SHA512
  3cf0523bddc213f206ed0ca57803550cb7db9e293392d3741138be47f49d9027ef517e1656235a349a62b492d35c3fc677714dc00afe59e2d36144a9689cfa8f
)

file(RENAME ${SOURCE_PATH}/CMakeLists.txt ${SOURCE_PATH}/PackageProject.cmake)

set(items ${SOURCE_PATH}/PackageProject.cmake ${SOURCE_PATH}/version.h.in
          ${SOURCE_PATH}/Config.cmake.in)
vcpkg_cmake_module(PATH_LIST ${items})

file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
