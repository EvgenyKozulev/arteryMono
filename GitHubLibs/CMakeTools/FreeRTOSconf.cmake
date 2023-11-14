cmake_minimum_required(VERSION 3.15)

add_library(freertos_config INTERFACE)
set(freertos_include "${CMAKE_SOURCE_DIR}/ConfigAndSettings/FreeRtos"
    "${CMAKE_SOURCE_DIR}/GitHubLibs/ArteryTec/AT_437_435/libraries/cmsis/cm4/device_support")
target_include_directories(freertos_config SYSTEM INTERFACE "${freertos_include}") # The config file directory
target_compile_definitions(freertos_config INTERFACE projCOVERAGE_TEST=0)
set(FREERTOS_HEAP "4" CACHE STRING "" FORCE)
set(FREERTOS_PORT "GCC_ARM_CM4F" CACHE STRING "" FORCE)
add_subdirectory("${CMAKE_SOURCE_DIR}/GitHubLibs/FreeRTOS/FreeRTOS/Source")