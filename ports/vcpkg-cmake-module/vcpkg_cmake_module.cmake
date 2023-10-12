include_guard(GLOBAL)
#[[
This function install cmake module paths under the target path
share/${PORT}/_modules/${PORT}.

Example:
  # some modules under the path `dummy/path`
  file(GLOB _paths "dummy/path/*")
  vcpkg_cmake_module(PATH_LIST ${_paths})

Note:
  Once the function was used, not only path modules would be moved to the
  target path, but also a variable ${PORT}_MODULE_PATH would target to it.
]]
function(vcpkg_cmake_module)
  # Set options
  set(_opt)
  set(_single_opt PACKAGE_NAME MODULE_PATH)
  set(_multi_opt PATH_LIST)
  cmake_parse_arguments(PARSE_ARGV 0 "arg" "${_opt}" "${_single_opt}"
                        "${_multi_opt}")

  if(DEFINED arg_UNPARSED_ARGUMENTS)
    message(
      FATAL_ERROR
        "${CMAKE_CURRENT_FUNCTION} was passed extra arguments: ${arg_UNPARSED_ARGUMENTS}"
    )
  endif()

  if(NOT arg_PATH_LIST)
    message(FATAL_ERROR "PATH_LIST cannot be empty")
  endif()

  if(NOT arg_PACKAGE_NAME)
    set(arg_PACKAGE_NAME "${PORT}")
  endif()

  if(NOT arg_MODULE_PATH)
    set(arg_MODULE_PATH "${arg_PACKAGE_NAME}")
  endif()

  set(_in_shared_dir_name "_modules")
  set(_modules_root "${_in_shared_dir_name}/${arg_MODULE_PATH}")
  set(_export_in_vcpkg_cmake_wrapper
      "include_guard(GLOBAL)\n\nlist(APPEND CMAKE_MODULE_PATH \${CMAKE_CURRENT_LIST_DIR}/${_in_shared_dir_name})\n"
  )
  string(
    APPEND _export_in_vcpkg_cmake_wrapper
    "set(${PORT}_MODULE_PATH \${CMAKE_CURRENT_LIST_DIR}/${_modules_root})\n")

  foreach(_path ${arg_PATH_LIST})
    if(IS_DIRECTORY ${_path})
      # Delete tail "/"
      if(_path MATCHES [[(/$)]])
        string(REGEX REPLACE [[(/$)]] "" _path ${_path})
      endif()

      # Install as subdir
      file(INSTALL ${_path}
           DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}/${_modules_root}")
    else()
      file(INSTALL "${_path}"
           DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}/${_modules_root})
    endif()
  endforeach()

  file(WRITE ${CURRENT_BUILDTREES_DIR}/vcpkg-cmake-wrapper.cmake
       ${_export_in_vcpkg_cmake_wrapper})

  file(INSTALL ${CURRENT_BUILDTREES_DIR}/vcpkg-cmake-wrapper.cmake
       DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

  unset(_in_shared_dir_name)
  unset(_modules_root)
  unset(_export_in_vcpkg_cmake_wrapper)

endfunction()
