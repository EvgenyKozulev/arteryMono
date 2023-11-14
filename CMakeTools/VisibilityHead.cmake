cmake_minimum_required(VERSION 3.15)

set(PublicHead "")
set(PrivateHead "")

# set(NewlibHead "${CMAKE_SOURCE_DIR}/NewLibs")

set(PrivateHead "${PrivateHead}")

set(PublicHead "${PublicHead}")

target_include_directories(${PROJECT_NAME}.elf PUBLIC "${PublicHead}")
target_include_directories(${PROJECT_NAME}.elf PRIVATE "${PrivateHead}")