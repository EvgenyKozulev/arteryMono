cmake_minimum_required(VERSION 3.15)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

set(Boost_USE_STATIC_LIBS OFF)
set(Boost_USE_MULTITHREADED ON)

set(CMAKE_C_COMPILER_WORKS ON)
set(CMAKE_CXX_COMPILER_WORKS ON)

project(Artery VERSION 0.1.0 LANGUAGES C ASM)
set(Warnings "-Wextra -pipe -Wshadow -Wpointer-arith -Wbad-function-cast -Wsign-compare -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wunused")
set(MainSrc "${CMAKE_SOURCE_DIR}/main/main.c")
set(PlatformSrc)
set(LwipPortSrc)

include("${CMAKE_SOURCE_DIR}/Platform/ArteryTec/PlatformArteryCMSIS.cmake")
include("${CMAKE_SOURCE_DIR}/GitHubLibs/CMakeTools/FreeRTOSconf.cmake")
include("${CMAKE_SOURCE_DIR}/GitHubLibs/CMakeTools/LWIPconf.cmake")

message("platform src::${PlatformSrc}")
add_executable(${PROJECT_NAME}.elf "${MainSrc}" "${PlatformSrc}" "${LwipPortSrc}")

add_definitions("-DAT32F437ZMT7" "${Warnings}" "-D__NEWLIB__")

# add_subdirectory("${CMAKE_SOURCE_DIR}/GitHubLibs/ArteryTec/AT_437_435/libraries/cmsis/dsp/Source")
set_target_properties(${PROJECT_NAME}.elf PROPERTIES LINK_DEPENDS ${LinkerScript})
target_link_libraries(${PROJECT_NAME}.elf DriversAt_437_435)
target_link_libraries(${PROJECT_NAME}.elf freertos_kernel)
target_link_libraries(${PROJECT_NAME}.elf lwipcontribapps lwipallapps lwipcore)

include("${CMAKE_SOURCE_DIR}/CMakeTools/VisibilityHead.cmake")

# custom commands
include("${CMAKE_SOURCE_DIR}/CMakeTools/HexBinMapCommand.cmake")
# custom target
include("${CMAKE_SOURCE_DIR}/CMakeTools/FlashTarget.cmake")
