cmake_minimum_required(VERSION 3.12)

include(tool/gcc_compiler.cmake)

if(CORE STREQUAL "STM32F051")
    message(STATUS "Building firmware for STM32F051")
    include(core/STM32F051/core.cmake)
elseif(CORE STREQUAL "STM32F103")
    message(STATUS "Building firmware for STM32F103")
    include(core/STM32F103/core.cmake)
else()
    message(FATAL_ERROR "CORE '${CORE}' is not supported!")
endif()

project(MFlightFirmware C)

enable_language(C ASM)
set(TARGET_BUILD ${PROJECT_NAME}_${CORE}.elf)

# Find source hal
file(GLOB HAL_SOURCES ${HAL_DRIVER_PATH}/Src/*.c)
list(APPEND SOURCES ${HAL_SOURCES})

add_executable(${TARGET_BUILD} src/main.c ${SOURCES})

target_include_directories(${TARGET_BUILD}
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/core/${CORE}
        ${HAL_DRIVER_PATH}/Inc
        ${CMSIS_DRIVER_PATH}/Include
        ${CMAKE_CURRENT_SOURCE_DIR}/src/driver/CMSIS/Include
)

# MAVLink include dir
target_include_directories(${TARGET_BUILD}
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/src/lib/mavlink
        ${CMAKE_CURRENT_SOURCE_DIR}/src/lib/mavlink/common
)
