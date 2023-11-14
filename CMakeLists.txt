cmake_minimum_required(VERSION 3.15)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)
set(CMAKE_VERBOSE_MAKEFILE ON)


set(Boost_USE_STATIC_LIBS OFF)
set(Boost_USE_MULTITHREADED ON)

set(CMAKE_C_COMPILER_WORKS ON)
set(CMAKE_CXX_COMPILER_WORKS ON)

project(Artery VERSION 0.1.0 LANGUAGES C ASM)
set(MainSrc "${CMAKE_SOURCE_DIR}/main/main.c")
set(PlatformSrc "")

include("${CMAKE_SOURCE_DIR}/CMakeTools/AddNewLibs.cmake")

add_executable(${PROJECT_NAME}.elf "${MainSrc}" "${PlatformSrc}")
