diff --git a/CMakeLists.txt b/CMakeLists.txt
index 7ed6432..4a4b3f6 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -7,57 +7,18 @@ set(CMAKE_WARN_UNUSED_CLI YES)
 
 set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
 
-if (NOT XCODE AND NOT MSVC AND NOT CMAKE_BUILD_TYPE)
-    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
-    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
-endif()
-
 message("CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}")
 
 # Add path to modules
 list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/")
 
 set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
-set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
-
-if (CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
-    set(LLAMA_STANDALONE ON)
-
-    include(git-vars)
-
-    # configure project version
-    # TODO
-else()
-    set(LLAMA_STANDALONE OFF)
-endif()
+set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
+set(LLAMA_STANDALONE ON)
 
 option(LLAMA_USE_SYSTEM_GGML "Use system libggml" OFF)
 
-option(LLAMA_WASM_MEM64 "llama: use 64-bit memory in WASM builds" ON)
-
-if (EMSCRIPTEN)
-    set(BUILD_SHARED_LIBS_DEFAULT OFF)
-
-    # Use 64-bit memory to support backend_get_memory queries
-    # TODO: analyze performance impact, see https://spidermonkey.dev/blog/2025/01/15/is-memory64-actually-worth-using
-    if (LLAMA_WASM_MEM64)
-      add_compile_options("-sMEMORY64=1")
-      add_link_options("-sMEMORY64=1")
-    endif()
-    add_link_options("-sALLOW_MEMORY_GROWTH=1")
-
-    option(LLAMA_WASM_SINGLE_FILE "llama: embed WASM inside the generated llama.js" OFF)
-    option(LLAMA_BUILD_HTML "llama: build HTML file" ON)
-    if (LLAMA_BUILD_HTML)
-        set(CMAKE_EXECUTABLE_SUFFIX ".html")
-    endif()
-else()
-    if (MINGW)
-        set(BUILD_SHARED_LIBS_DEFAULT OFF)
-    else()
-        set(BUILD_SHARED_LIBS_DEFAULT ON)
-    endif()
-endif()
+set(BUILD_SHARED_LIBS_DEFAULT ON)
 
 option(BUILD_SHARED_LIBS "build shared libraries" ${BUILD_SHARED_LIBS_DEFAULT})
 
@@ -65,25 +26,6 @@ if (WIN32)
     add_compile_definitions(_CRT_SECURE_NO_WARNINGS)
 endif()
 
-if (MSVC)
-    add_compile_options("$<$<COMPILE_LANGUAGE:C>:/utf-8>")
-    add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:/utf-8>")
-    add_compile_options("$<$<COMPILE_LANGUAGE:C>:/bigobj>")
-    add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:/bigobj>")
-endif()
-
-if (LLAMA_STANDALONE)
-    # enable parallel builds for msbuild
-    list(APPEND CMAKE_VS_GLOBALS UseMultiToolTask=true)
-    list(APPEND CMAKE_VS_GLOBALS EnforceProcessCountAcrossBuilds=true)
-endif()
-
-if (CMAKE_SYSTEM_NAME STREQUAL "iOS")
-    set(LLAMA_TOOLS_INSTALL_DEFAULT OFF)
-else()
-    set(LLAMA_TOOLS_INSTALL_DEFAULT ${LLAMA_STANDALONE})
-endif()
-
 #
 # option list
 #
