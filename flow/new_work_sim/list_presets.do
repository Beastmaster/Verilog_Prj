onerr {resume}
add list -bin /test_bench/clk
add list -hex /test_bench/DUT/the_sdram_0/az_addr
add list -hex /test_bench/DUT/the_sdram_0/az_be_n
add list -bin /test_bench/DUT/the_sdram_0/az_cs
add list -hex /test_bench/DUT/the_sdram_0/az_data
add list -bin /test_bench/DUT/the_sdram_0/az_rd_n
add list -bin /test_bench/DUT/the_sdram_0/az_wr_n
add list -bin /test_bench/DUT/the_sdram_0/clk
add list -hex /test_bench/DUT/the_sdram_0/za_data
add list -bin /test_bench/DUT/the_sdram_0/za_valid
add list -bin /test_bench/DUT/the_sdram_0/za_waitrequest
add list -asc /test_bench/DUT/the_sdram_0/CODE
add list -hex /test_bench/DUT/the_sdram_0/zs_addr
add list -hex /test_bench/DUT/the_sdram_0/zs_ba
add list -hex /test_bench/DUT/the_sdram_0/zs_cs_n
add list -bin /test_bench/DUT/the_sdram_0/zs_ras_n
add list -bin /test_bench/DUT/the_sdram_0/zs_cas_n
add list -bin /test_bench/DUT/the_sdram_0/zs_we_n
add list -hex /test_bench/DUT/the_sdram_0/zs_dq
add list -hex /test_bench/DUT/the_sdram_0/zs_dqm
add list -hex /test_bench/DUT/the_cpu_0/i_readdata
add list -hex /test_bench/DUT/the_cpu_0/i_readdatavalid
add list -hex /test_bench/DUT/the_cpu_0/i_waitrequest
add list -hex /test_bench/DUT/the_cpu_0/i_address
add list -hex /test_bench/DUT/the_cpu_0/i_read
add list -hex /test_bench/DUT/the_cpu_0/i_burstcount
add list -hex /test_bench/DUT/the_cpu_0/clk
add list -hex /test_bench/DUT/the_cpu_0/reset_n
add list -hex /test_bench/DUT/the_cpu_0/d_readdata
add list -hex /test_bench/DUT/the_cpu_0/d_waitrequest
add list -hex /test_bench/DUT/the_cpu_0/d_irq
add list -hex /test_bench/DUT/the_cpu_0/d_address
add list -hex /test_bench/DUT/the_cpu_0/d_byteenable
add list -hex /test_bench/DUT/the_cpu_0/d_read
add list -hex /test_bench/DUT/the_cpu_0/d_write
add list -hex /test_bench/DUT/the_cpu_0/d_writedata
add list -hex /test_bench/DUT/the_cpu_0/d_readdatavalid
add list -hex /test_bench/DUT/the_cpu_0/cpu_resetrequest
add list -hex /test_bench/DUT/the_cpu_0/cpu_resettaken
add list -hex /test_bench/DUT/the_cpu_0/the_cpu_0_test_bench/W_pcb
add list -asc /test_bench/DUT/the_cpu_0/the_cpu_0_test_bench/W_vinst
add list -hex /test_bench/DUT/the_cpu_0/the_cpu_0_test_bench/W_valid
add list -hex /test_bench/DUT/the_cpu_0/the_cpu_0_test_bench/W_iw
add list -hex /test_bench/DUT/the_jtag_uart_0/av_address
add list -bin /test_bench/DUT/the_jtag_uart_0/av_chipselect
add list -bin /test_bench/DUT/the_jtag_uart_0/av_irq
add list -bin /test_bench/DUT/the_jtag_uart_0/av_read_n
add list -hex /test_bench/DUT/the_jtag_uart_0/av_readdata
add list -bin /test_bench/DUT/the_jtag_uart_0/av_waitrequest
add list -bin /test_bench/DUT/the_jtag_uart_0/av_write_n
add list -hex /test_bench/DUT/the_jtag_uart_0/av_writedata
add list -bin /test_bench/DUT/the_jtag_uart_0/dataavailable
add list -bin /test_bench/DUT/the_jtag_uart_0/readyfordata
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -delta none
configure list -usegating 1
configure list -gateexpr { /test_bench/clk'rising }