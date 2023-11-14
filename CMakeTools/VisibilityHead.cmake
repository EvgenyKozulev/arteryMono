cmake_minimum_required(VERSION 3.15)

set(PublicHead "")
set(PrivateHead "")

# set(NewlibHead "${CMAKE_SOURCE_DIR}/NewLibs")
set(ClockHead "${CMAKE_SOURCE_DIR}/Platform/ArteryTec/AT_437-435/inc")
set(CMSIShead "${CMAKE_SOURCE_DIR}/GitHubLibs/ArteryTec/AT_437_435/libraries/cmsis/cm4/core_support")
set(DeviceHead "${CMAKE_SOURCE_DIR}/GitHubLibs/ArteryTec/AT_437_435/libraries/cmsis/cm4/device_support")
set(DriversHead "${CMAKE_SOURCE_DIR}/GitHubLibs/ArteryTec/AT_437_435/libraries/drivers/inc")

set(PrivateHead "${PrivateHead}"
    "${DeviceHead}"
    "${CMSIShead}")

set(PublicHead "${PublicHead}"
    "${ClockHead}"
    "${DriversHead}")

target_include_directories(${PROJECT_NAME}.elf PUBLIC "${PublicHead}")
target_include_directories(${PROJECT_NAME}.elf PRIVATE "${PrivateHead}")