file(GLOB CORE_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/core/STM32F103/*.c)
file(GLOB CORE_ASM_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/core/STM32F103/*.s)
list(APPEND SOURCES ${CORE_SOURCES} ${CORE_ASM_SOURCES})

set(CMAKE_C_FLAGS "-mcpu=cortex-m3 --specs=nano.specs -mfloat-abi=soft -mthumb -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -DSTM32F103xB" CACHE STRING "" FORCE)
set(CMAKE_EXE_LINKER_FLAGS "-T${CMAKE_CURRENT_SOURCE_DIR}/core/STM32F103/STM32F103C8TX_FLASH.ld -Wl,--gc-sections -static -Wl,--start-group -lc -lm -Wl,--end-group" CACHE STRING "" FORCE)
set(HAL_DRIVER_PATH ${CMAKE_CURRENT_SOURCE_DIR}/src/driver/STM32F1xx_HAL_Driver)
set(CMSIS_DRIVER_PATH ${CMAKE_CURRENT_SOURCE_DIR}/src/driver/CMSIS/Device/ST/STM32F1xx)
