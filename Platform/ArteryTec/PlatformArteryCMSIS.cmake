cmake_minimum_required(VERSION 3.15)
set(ClockSrc "${CMAKE_SOURCE_DIR}/Platform/ArteryTec/AT_437-435/src/at32f435_437_clock.c")
set(PlatformSrc "${PlatformSrc}" "${ClockSrc}")

set(ArteryHead "${CMAKE_SOURCE_DIR}/Platform/ArteryTec/AT_437-435/inc")

include("${CMAKE_SOURCE_DIR}/GitHubLibs/CMakeTools/PlatformArteryTools.cmake")

