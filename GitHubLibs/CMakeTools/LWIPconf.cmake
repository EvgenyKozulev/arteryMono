cmake_minimum_required(VERSION 3.15)

# set(LWIP_DEFINITIONS LWIP_DEBUG=1)
set(LWIP_DIR "${CMAKE_SOURCE_DIR}/GitHubLibs/lwip")
set(LWIP_INCLUDE_DIRS
    "${LWIP_DIR}/src/include"
    "${LWIP_DIR}/contrib"
    "${CMAKE_SOURCE_DIR}/ConfigAndSettings/lwip/port"
    "${CMAKE_SOURCE_DIR}/ConfigAndSettings/lwip/port/arch"
    "${CMAKE_SOURCE_DIR}/GitHubLibs/lwip/src/include/lwip"
    "${CMAKE_SOURCE_DIR}/ConfigAndSettings/lwip"
     "${CMAKE_SOURCE_DIR}/ConfigAndSettings/lwip/memalign"
)
set(LWIP_CONTRIB_DIR "${CMAKE_SOURCE_DIR}/githublibs/lwip/contrib")
set(LwipPortSrc "${LwipPortSrc}"
    "${CMAKE_SOURCE_DIR}/ConfigAndSettings/lwip/port/sys_arch.c"
    "${CMAKE_SOURCE_DIR}/ConfigAndSettings/lwip/port/ethernetif.c"
    "${CMAKE_SOURCE_DIR}/ConfigAndSettings/lwip/hEmac/at32_emac.c"
    "${CMAKE_SOURCE_DIR}/ConfigAndSettings/lwip/hEmac/netconf.c"
     "${CMAKE_SOURCE_DIR}/ConfigAndSettings/lwip/memalign/CusnomMem.c"
)

include(${LWIP_DIR}/src/Filelists.cmake)
include(${LWIP_DIR}/contrib/Filelists.cmake)

target_link_libraries(lwipcore freertos_kernel)
target_link_libraries(lwipcontribapps freertos_kernel)
target_link_libraries(lwipallapps freertos_kernel)