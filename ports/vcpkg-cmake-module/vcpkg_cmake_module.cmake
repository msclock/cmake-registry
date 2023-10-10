include_guard(GLOBAL)

function(vcpkg_cmake_module)
  # Set options
  set(_opt)
  set(_single_opt PACKAGE_NAME MODULE_PATH)
  set(_multi_opt FILE_LIST DIRECTORY_LIST)
  cmake_parse_arguments(PARSE_ARGV 0 "arg" "${_opt}" "${_single_opt}"
                        "${_multi_opt}")

  if(DEFINED arg_UNPARSED_ARGUMENTS)
    message(
      FATAL_ERROR
        "${CMAKE_CURRENT_FUNCTION} was passed extra arguments: ${arg_UNPARSED_ARGUMENTS}"
    )
  endif()

  if(NOT arg_FILE_LIST AND NOT arg_DIRECTORY_LIST)
    message(
      FATAL_ERROR "Both arg_FILE_LIST and arg_DIRECTORY_LIST cannot be empty")
  endif()

  if(NOT arg_PACKAGE_NAME)
    set(arg_PACKAGE_NAME "${PORT}")
  endif()

  if(NOT arg_MODULE_PATH)
    set(arg_MODULE_PATH "${arg_PACKAGE_NAME}")
  endif()

  set(_modules_dir_path "_modules")
  set(_modules_path "${_modules_dir_path}/${arg_MODULE_PATH}")
  set(_export_in_vcpkg_cmake_wrapper
      "include_guard(GLOBAL)\n\nlist(APPEND CMAKE_MODULE_PATH \${CMAKE_CURRENT_LIST_DIR}/${_modules_dir_path})\n"
  )
  string(
    APPEND
    _export_in_vcpkg_cmake_wrapper
    "list(APPEND CMAKE_PREFIX_PATH \${CMAKE_CURRENT_LIST_DIR}/${_modules_path})\n"
  )

  if(arg_FILE_LIST)
    foreach(_file ${arg_FILE_LIST})
      file(INSTALL "${_file}"
           DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}/${_modules_path})
    endforeach()
  endif()

  if(arg_DIRECTORY_LIST)
    foreach(_dir "${arg_DIRECTORY_LIST}")
      if(NOT IS_DIRECTORY ${_dir})
        message(
          FATAL_ERROR
            "DIRECTORY_LIST must pass with directories, error: ${arg_DIRECTORY_LIST}"
        )
      endif()

      get_filename_component(_dir_name ${_dir} NAME_WE)

      string(
        APPEND
        _export_in_vcpkg_cmake_wrapper
        "list(APPEND CMAKE_PREFIX_PATH \${CMAKE_CURRENT_LIST_DIR}/${_modules_path}/${_dir_name})\n"
      )

      file(
        GLOB_RECURSE _dir_itmes
        LIST_DIRECTORIES ON
        RELATIVE "${_dir}"
        "${_dir}/*")
      list(FILTER _dir_itmes EXCLUDE REGEX [[^\.]])
      message(STATUS ${_dir_itmes})
      foreach(_item ${_dir_itmes})
        if(IS_DIRECTORY "${_dir}/${_item}")
          string(
            APPEND
            _export_in_vcpkg_cmake_wrapper
            "${_export_in_vcpkg_cmake_wrapper}list(APPEND CMAKE_PREFIX_PATH "
            "\${CMAKE_CURRENT_LIST_DIR}/${_modules_dir_path}/${_dir_name}/${_item})\n"
          )
        endif()
      endforeach()

      # Install as subdir
      file(INSTALL ${_dir}
           DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}/${_modules_path}")

    endforeach()
  endif()

  file(WRITE ${CURRENT_PACKAGES_DIR}/share/${PORT}/vcpkg-cmake-wrapper.cmake
       ${_export_in_vcpkg_cmake_wrapper})

  unset(_modules_dir_path)
  unset(_modules_path)
  unset(_export_in_vcpkg_cmake_wrapper)

endfunction()
