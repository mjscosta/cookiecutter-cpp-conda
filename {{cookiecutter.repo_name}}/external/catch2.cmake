cmake_minimum_required(VERSION 3.3.0)
#project(catch_builder CXX)
# NOTE: use C++11
include(ExternalProject)
find_package(Git REQUIRED)

set(TARGET_NAME catch2)

#TODO: test under windows, the generator might be nmake or jom, so the build command might not be the same

ExternalProject_Add(
    ${TARGET_NAME}-ext 
    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG "v2.2.2" 
    TIMEOUT 10
    GIT_SHALLOW 1
    GIT_PROGRESS 1
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND "${CMAKE_COMMAND} --build . --target all"
    INSTALL_COMMAND "${CMAKE_COMMAND} --build . --target install"
    INSTALL_DIR ${CMAKE_BINARY_DIR}
    LOG_DOWNLOAD ON
   )

# Expose required variable (CATCH_INCLUDE_DIR) to parent scope
ExternalProject_Get_Property(${TARGET_NAME}-ext source_dir)
#set(${TARGET_NAME}_INCLUDE_DIR ${source_dir}/single_include CACHE INTERNAL "Path to include folder for Catch")

# Library
add_library(${TARGET_NAME} INTERFACE)
add_dependencies(${TARGET_NAME} ${TARGET_NAME}-ext)
target_include_directories(${TARGET_NAME} INTERFACE ${source_dir}/single_include)
