/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2_qsys' in SOPC Builder design 'DE4_QSYS'
 * SOPC Builder design path: D:/Projects/fpl16/DE4_DDR2_UniPHY/DE4_QSYS.sopcinfo
 *
 * Generated: Wed Jul 01 13:21:58 BST 2015
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_qsys"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x41040820
#define ALT_CPU_CPU_FREQ 150000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x1f
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 2048
#define ALT_CPU_EXCEPTION_ADDR 0x41020020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 150000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 1
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 4096
#define ALT_CPU_INITDA_SUPPORTED
#define ALT_CPU_INST_ADDR_WIDTH 0x1f
#define ALT_CPU_NAME "nios2_qsys"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_RESET_ADDR 0x41020000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x41040820
#define NIOS2_CPU_FREQ 150000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x1f
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_EXCEPTION_ADDR 0x41020020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 1
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 0x1f
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_RESET_ADDR 0x41020000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_DMA
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_MEM_IF_DDR2_EMIF
#define __ALTERA_NIOS2_QSYS


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Stratix IV"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x41041020
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x41041020
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x41041020
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "DE4_QSYS"


/*
 * button configuration
 *
 */

#define ALT_MODULE_CLASS_button altera_avalon_pio
#define BUTTON_BASE 0x40000050
#define BUTTON_BIT_CLEARING_EDGE_REGISTER 0
#define BUTTON_BIT_MODIFYING_OUTPUT_REGISTER 0
#define BUTTON_CAPTURE 0
#define BUTTON_DATA_WIDTH 4
#define BUTTON_DO_TEST_BENCH_WIRING 0
#define BUTTON_DRIVEN_SIM_VALUE 0
#define BUTTON_EDGE_TYPE "NONE"
#define BUTTON_FREQ 50000000
#define BUTTON_HAS_IN 1
#define BUTTON_HAS_OUT 0
#define BUTTON_HAS_TRI 0
#define BUTTON_IRQ -1
#define BUTTON_IRQ_INTERRUPT_CONTROLLER_ID -1
#define BUTTON_IRQ_TYPE "NONE"
#define BUTTON_NAME "/dev/button"
#define BUTTON_RESET_VALUE 0
#define BUTTON_SPAN 16
#define BUTTON_TYPE "altera_avalon_pio"


/*
 * ddr2_i2c_scl configuration
 *
 */

#define ALT_MODULE_CLASS_ddr2_i2c_scl altera_avalon_pio
#define DDR2_I2C_SCL_BASE 0x40000030
#define DDR2_I2C_SCL_BIT_CLEARING_EDGE_REGISTER 0
#define DDR2_I2C_SCL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define DDR2_I2C_SCL_CAPTURE 0
#define DDR2_I2C_SCL_DATA_WIDTH 1
#define DDR2_I2C_SCL_DO_TEST_BENCH_WIRING 0
#define DDR2_I2C_SCL_DRIVEN_SIM_VALUE 0
#define DDR2_I2C_SCL_EDGE_TYPE "NONE"
#define DDR2_I2C_SCL_FREQ 50000000
#define DDR2_I2C_SCL_HAS_IN 0
#define DDR2_I2C_SCL_HAS_OUT 1
#define DDR2_I2C_SCL_HAS_TRI 0
#define DDR2_I2C_SCL_IRQ -1
#define DDR2_I2C_SCL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DDR2_I2C_SCL_IRQ_TYPE "NONE"
#define DDR2_I2C_SCL_NAME "/dev/ddr2_i2c_scl"
#define DDR2_I2C_SCL_RESET_VALUE 0
#define DDR2_I2C_SCL_SPAN 16
#define DDR2_I2C_SCL_TYPE "altera_avalon_pio"


/*
 * ddr2_i2c_sda configuration
 *
 */

#define ALT_MODULE_CLASS_ddr2_i2c_sda altera_avalon_pio
#define DDR2_I2C_SDA_BASE 0x40000020
#define DDR2_I2C_SDA_BIT_CLEARING_EDGE_REGISTER 0
#define DDR2_I2C_SDA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define DDR2_I2C_SDA_CAPTURE 0
#define DDR2_I2C_SDA_DATA_WIDTH 1
#define DDR2_I2C_SDA_DO_TEST_BENCH_WIRING 0
#define DDR2_I2C_SDA_DRIVEN_SIM_VALUE 0
#define DDR2_I2C_SDA_EDGE_TYPE "NONE"
#define DDR2_I2C_SDA_FREQ 50000000
#define DDR2_I2C_SDA_HAS_IN 0
#define DDR2_I2C_SDA_HAS_OUT 0
#define DDR2_I2C_SDA_HAS_TRI 1
#define DDR2_I2C_SDA_IRQ -1
#define DDR2_I2C_SDA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DDR2_I2C_SDA_IRQ_TYPE "NONE"
#define DDR2_I2C_SDA_NAME "/dev/ddr2_i2c_sda"
#define DDR2_I2C_SDA_RESET_VALUE 0
#define DDR2_I2C_SDA_SPAN 16
#define DDR2_I2C_SDA_TYPE "altera_avalon_pio"


/*
 * dma configuration
 *
 */

#define ALT_MODULE_CLASS_dma altera_avalon_dma
#define DMA_ALLOW_BYTE_TRANSACTIONS 0
#define DMA_ALLOW_DOUBLEWORD_TRANSACTIONS 0
#define DMA_ALLOW_HW_TRANSACTIONS 1
#define DMA_ALLOW_QUADWORD_TRANSACTIONS 0
#define DMA_ALLOW_WORD_TRANSACTIONS 0
#define DMA_BASE 0x41041000
#define DMA_IRQ 2
#define DMA_IRQ_INTERRUPT_CONTROLLER_ID 0
#define DMA_LENGTHWIDTH 31
#define DMA_MAX_BURST_SIZE 1
#define DMA_NAME "/dev/dma"
#define DMA_SPAN 32
#define DMA_TYPE "altera_avalon_dma"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x41041020
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * led configuration
 *
 */

#define ALT_MODULE_CLASS_led altera_avalon_pio
#define LED_BASE 0x40000040
#define LED_BIT_CLEARING_EDGE_REGISTER 0
#define LED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LED_CAPTURE 0
#define LED_DATA_WIDTH 8
#define LED_DO_TEST_BENCH_WIRING 0
#define LED_DRIVEN_SIM_VALUE 0
#define LED_EDGE_TYPE "NONE"
#define LED_FREQ 50000000
#define LED_HAS_IN 0
#define LED_HAS_OUT 1
#define LED_HAS_TRI 0
#define LED_IRQ -1
#define LED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LED_IRQ_TYPE "NONE"
#define LED_NAME "/dev/led"
#define LED_RESET_VALUE 0
#define LED_SPAN 16
#define LED_TYPE "altera_avalon_pio"


/*
 * mem_if_ddr2_emif configuration
 *
 */

#define ALT_MODULE_CLASS_mem_if_ddr2_emif altera_mem_if_ddr2_emif
#define MEM_IF_DDR2_EMIF_BASE 0x0
#define MEM_IF_DDR2_EMIF_IRQ -1
#define MEM_IF_DDR2_EMIF_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MEM_IF_DDR2_EMIF_NAME "/dev/mem_if_ddr2_emif"
#define MEM_IF_DDR2_EMIF_SPAN 1073741824
#define MEM_IF_DDR2_EMIF_TYPE "altera_mem_if_ddr2_emif"


/*
 * mem_if_ddr2_emif configuration as viewed by dma_read_master
 *
 */

#define DMA_READ_MASTER_MEM_IF_DDR2_EMIF_BASE 0x0
#define DMA_READ_MASTER_MEM_IF_DDR2_EMIF_IRQ -1
#define DMA_READ_MASTER_MEM_IF_DDR2_EMIF_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DMA_READ_MASTER_MEM_IF_DDR2_EMIF_NAME "/dev/mem_if_ddr2_emif"
#define DMA_READ_MASTER_MEM_IF_DDR2_EMIF_SPAN 1073741824
#define DMA_READ_MASTER_MEM_IF_DDR2_EMIF_TYPE "altera_mem_if_ddr2_emif"


/*
 * onchip_memory configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory altera_avalon_onchip_memory2
#define ONCHIP_MEMORY_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY_BASE 0x41020000
#define ONCHIP_MEMORY_CONTENTS_INFO ""
#define ONCHIP_MEMORY_DUAL_PORT 0
#define ONCHIP_MEMORY_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY_INIT_CONTENTS_FILE "DE4_QSYS_onchip_memory"
#define ONCHIP_MEMORY_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY_IRQ -1
#define ONCHIP_MEMORY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY_NAME "/dev/onchip_memory"
#define ONCHIP_MEMORY_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY_SIZE_VALUE 128000
#define ONCHIP_MEMORY_SPAN 128000
#define ONCHIP_MEMORY_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY_WRITABLE 1


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid_qsys
#define SYSID_BASE 0x40000060
#define SYSID_ID 0
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1434054750
#define SYSID_TYPE "altera_avalon_sysid_qsys"


/*
 * test_demo3 configuration as viewed by dma_write_master
 *
 */

#define DMA_WRITE_MASTER_TEST_DEMO3_BASE 0x0
#define DMA_WRITE_MASTER_TEST_DEMO3_IRQ -1
#define DMA_WRITE_MASTER_TEST_DEMO3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DMA_WRITE_MASTER_TEST_DEMO3_NAME "/dev/test_demo3"
#define DMA_WRITE_MASTER_TEST_DEMO3_SPAN 2
#define DMA_WRITE_MASTER_TEST_DEMO3_TYPE "test_demo3"


/*
 * timer configuration
 *
 */

#define ALT_MODULE_CLASS_timer altera_avalon_timer
#define TIMER_ALWAYS_RUN 0
#define TIMER_BASE 0x40000000
#define TIMER_COUNTER_SIZE 32
#define TIMER_FIXED_PERIOD 0
#define TIMER_FREQ 50000000
#define TIMER_IRQ 1
#define TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_LOAD_VALUE 49999
#define TIMER_MULT 0.0010
#define TIMER_NAME "/dev/timer"
#define TIMER_PERIOD 1
#define TIMER_PERIOD_UNITS "ms"
#define TIMER_RESET_OUTPUT 0
#define TIMER_SNAPSHOT 1
#define TIMER_SPAN 32
#define TIMER_TICKS_PER_SEC 1000.0
#define TIMER_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */
