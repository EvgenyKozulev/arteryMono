cmake_minimum_required(VERSION 3.15)

set(OpenOCD_Bin_Path "c:/Program Files/AT32IDE/OpenOCD/bin")
set(OpenOCD_Scripts_Path "c:/Program Files/AT32IDE/OpenOCD/scripts/")

add_custom_target(flash
    COMMAND ${OpenOCD_Bin_Path}/openocd.exe -s ${OpenOCD_Scripts_Path} -f interface/atlink.cfg -f target/at32f437xM.cfg -c "program ${PROJECT_NAME}.elf verify reset exit"
    DEPENDS ${PROJECT_NAME}.elf
    COMMENT "Flashing ${PROJECT_NAME}.elf with OpenOCD"
)