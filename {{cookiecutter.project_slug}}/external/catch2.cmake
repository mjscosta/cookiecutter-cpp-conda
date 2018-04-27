cmake_minimum_required(VERSION 3.3.0)
#project(catch_builder CXX)
# NOTE: use C++11
include(ExternalProject)
find_package(Git REQUIRED)

set(TARGET_NAME catch2)
set(PROJECT_PREFIX ${CMAKE_BINARY_DIR}/external)
set(PROJECT_OPTIONS "") # -D<options> ... for cmake
set(PROJECT_INSTALL_DIR ${CMAKE_BINARY_DIR}/install)

ExternalProject_Add(
    ${TARGET_NAME} 
    PREFIX ${PROJECT_PREFIX}
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG "v2.2.2" 
    TIMEOUT 10
    GIT_SHALLOW 1
    GIT_PROGRESS 1
    CMAKE_ARGS -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}
    LOG_DOWNLOAD ON
   )

