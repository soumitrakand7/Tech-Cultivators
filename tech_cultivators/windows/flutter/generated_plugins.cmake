#
# Generated file, do not edit.
#

list(APPEND FLUTTER_PLUGIN_LIST
  syncfusion_pdfviewer_windows
  url_launcher_windows
<<<<<<< HEAD
)

list(APPEND FLUTTER_FFI_PLUGIN_LIST
=======
>>>>>>> 65d0b609079f2a2676af10b1fb52a994a0c2d7a9
)

set(PLUGIN_BUNDLED_LIBRARIES)

foreach(plugin ${FLUTTER_PLUGIN_LIST})
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${plugin}/windows plugins/${plugin})
  target_link_libraries(${BINARY_NAME} PRIVATE ${plugin}_plugin)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES $<TARGET_FILE:${plugin}_plugin>)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${plugin}_bundled_libraries})
endforeach(plugin)
