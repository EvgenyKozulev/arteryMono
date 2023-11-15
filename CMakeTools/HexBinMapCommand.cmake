cmake_minimum_required(VERSION 3.15)

set(CMAKE_SIZE arm-none-eabi-size)

add_custom_command(
    TARGET ${PROJECT_NAME}.elf POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary ${PROJECT_NAME}.elf ${PROJECT_NAME}.bin
    COMMAND ${CMAKE_OBJCOPY} -O ihex ${PROJECT_NAME}.elf ${PROJECT_NAME}.hex
    COMMAND ${CMAKE_OBJDUMP} -S ${PROJECT_NAME}.elf > ${PROJECT_NAME}.S
    COMMAND ${CMAKE_NM} -a -l -S -s ${PROJECT_NAME}.elf > ${PROJECT_NAME}.map
)


add_custom_command(
    TARGET ${PROJECT_NAME}.elf POST_BUILD
    COMMAND ${CMAKE_SIZE} -A ${PROJECT_NAME}.elf
    COMMAND echo "Build - success"
    COMMAND echo "CMAKE_BUILD_TYPE::${CMAKE_BUILD_TYPE}"
)