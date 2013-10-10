# Display signals from module sdram_0
add wave -noupdate -divider {sdram_0}
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_sdram_0/az_addr
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_sdram_0/az_be_n
add wave -noupdate -format Logic /test_bench/DUT/the_sdram_0/az_cs
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_sdram_0/az_data
add wave -noupdate -format Logic /test_bench/DUT/the_sdram_0/az_rd_n
add wave -noupdate -format Logic /test_bench/DUT/the_sdram_0/az_wr_n
add wave -noupdate -format Logic /test_bench/DUT/the_sdram_0/clk
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_sdram_0/za_data
add wave -noupdate -format Logic /test_bench/DUT/the_sdram_0/za_valid
add wave -noupdate -format Logic /test_bench/DUT/the_sdram_0/za_waitrequest
add wave -noupdate -format Literal -radix ascii /test_bench/DUT/the_sdram_0/CODE
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_sdram_0/zs_addr
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_sdram_0/zs_ba
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_sdram_0/zs_cs_n
add wave -noupdate -format Logic /test_bench/DUT/the_sdram_0/zs_ras_n
add wave -noupdate -format Logic /test_bench/DUT/the_sdram_0/zs_cas_n
add wave -noupdate -format Logic /test_bench/DUT/the_sdram_0/zs_we_n
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_sdram_0/zs_dq
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_sdram_0/zs_dqm


# Display signals from module cpu_0
add wave -noupdate -divider {cpu_0}
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/i_readdata
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/i_readdatavalid
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/i_waitrequest
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/i_address
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/i_read
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/i_burstcount
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/clk
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/reset_n
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_readdata
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_waitrequest
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_irq
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_address
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_byteenable
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_read
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_write
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_writedata
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/d_readdatavalid
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/cpu_resetrequest
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/cpu_resettaken
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/the_cpu_0_test_bench/W_pcb
add wave -noupdate -format Logic -radix ascii /test_bench/DUT/the_cpu_0/the_cpu_0_test_bench/W_vinst
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/the_cpu_0_test_bench/W_valid
add wave -noupdate -format Logic -radix hexadecimal /test_bench/DUT/the_cpu_0/the_cpu_0_test_bench/W_iw


# Display signals from module jtag_uart_0
add wave -noupdate -divider {jtag_uart_0}
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_jtag_uart_0/av_address
add wave -noupdate -format Logic /test_bench/DUT/the_jtag_uart_0/av_chipselect
add wave -noupdate -format Logic /test_bench/DUT/the_jtag_uart_0/av_irq
add wave -noupdate -format Logic /test_bench/DUT/the_jtag_uart_0/av_read_n
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_jtag_uart_0/av_readdata
add wave -noupdate -format Logic /test_bench/DUT/the_jtag_uart_0/av_waitrequest
add wave -noupdate -format Logic /test_bench/DUT/the_jtag_uart_0/av_write_n
add wave -noupdate -format Literal -radix hexadecimal /test_bench/DUT/the_jtag_uart_0/av_writedata
add wave -noupdate -format Logic /test_bench/DUT/the_jtag_uart_0/dataavailable
add wave -noupdate -format Logic /test_bench/DUT/the_jtag_uart_0/readyfordata


configure wave -justifyvalue right
configure wave -signalnamewidth 1
TreeUpdate [SetDefaultTree]