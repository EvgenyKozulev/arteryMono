cmake_minimum_required(VERSION 3.15)

set(StartupSrc "${CMAKE_SOURCE_DIR}/GitHubLibs/ArteryTec/AT_437_435/libraries/cmsis/cm4/device_support/startup/gcc/startup_at32f435_437.s")
set(SystemSrc "${CMAKE_SOURCE_DIR}/GitHubLibs/ArteryTec/AT_437_435/libraries/cmsis/cm4/device_support/system_at32f435_437.c")
set(LinkerScript "${CMAKE_SOURCE_DIR}/GitHubLibs/ArteryTec/AT_437_435/libraries/cmsis/cm4/device_support/startup/gcc/linker/AT32F437xM_FLASH.ld")

set(MCU_CFlags "-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 ${CPU_FLAG}")

set(PlatformSrc "${PlatformSrc}" "${StartupSrc}" "${SystemSrc}")



set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${MCU_CFlags}")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${MCU_CFlags} -T${LinkerScript} -lc -lrdimon")
message("change CMAKE_C_FLAGS::${CMAKE_C_FLAGS}")
message("change CMAKE_EXE_LINKER_FLAGS::${CMAKE_EXE_LINKER_FLAGS}")

file(GLOB_RECURSE ArteryDrivers "${CMAKE_SOURCE_DIR}/GitHubLibs/ArteryTec/AT_437_435/libraries/drivers/src/*.c")
add_library(DriversAt_437_435 "${ArteryDrivers}")

set_target_properties(DriversAt_437_435 PROPERTIES LINK_DEPENDS ${LinkerScript})
set(ArteryCMSIS "${CMAKE_SOURCE_DIR}/GitHubLibs/ArteryTec/AT_437_435/libraries/cmsis/cm4/core_support")
set(ArteryDeviseHead "${CMAKE_SOURCE_DIR}/GitHubLibs/ArteryTec/AT_437_435/libraries/cmsis/cm4/device_support")
set(ArteryDriversHead "${CMAKE_SOURCE_DIR}/GitHubLibs/ArteryTec/AT_437_435/libraries/drivers/inc")
set(ArteryHead "${ArteryDriversHead}"
    "${ArteryHead}"
    "${ArteryDeviseHead}"
    "${ArteryCMSIS}")

target_include_directories(DriversAt_437_435 PRIVATE "${ArteryHead}")
