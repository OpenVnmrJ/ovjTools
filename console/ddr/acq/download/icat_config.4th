0x70000000 constant fpga

: dump 0 do dup i cells + @ x. cr loop drop ;
: clear 0 do dup i cells + 0 swap ! loop drop ;
: fill 0 do swap tuck i cells + ! loop drop ;
: extend16 dup 0x8000 and if 0xffff0000 or then ;
: f, here f! 1 cells allot ;
: >= < invert ;
: <= > invert ;
: f>= f< invert ;
: f<= f> invert ;
: f<> f= invert ;
: fpga! fpga + ! ;
: fpga@ fpga + @ ;
: <=>
  2dup
  < if 
    2drop -1
  else
  = if
    0
  else
    1
  then then
;

: t! 2dup swap x. x. ." !" cr ! ;

-4 constant icat_top_target_speed_grade 
12.5e fconstant ICAT_CLK_PERIOD 
0 constant ICAT_CLK_PHASE_SHIFT 
9 constant ICAT_CLK_PHASE_SHIFT_WIDTH 
4.0e fconstant ICAT_CLKDV_DIVIDE 
0 constant ICAT_CHIPSCOPE 
64 constant ICAT_DATA_PORT_WIDTH 
1024 constant ICAT_SAMPLE_DATA_DEPTH 
64 constant ICAT_MAX_DELAY 
4 constant ICAT_MAX_XMIT_LO_CUT_THROUGH_DELAY 
1 constant ICAT_XMIT_LO_POS 
512 constant ICAT_AMP_LIN_TABLE_DEPTH 
64 constant ICAT_AMP_GAIN_COMP_TABLE_DEPTH 
24 constant ICAT_ATTEN_OUTPUT_WIDTH 
7 constant ICAT_DELAY_OUTPUT_WIDTH 
512 constant ICAT_ATTEN_TABLE_DEPTH 
9 constant ICAT_LOG_ATTEN_TABLE_DEPTH 
1024 constant ICAT_ATTEN_TABLE_BUS_DEPTH 
6 constant ICAT_AUX_OUTPUT_WIDTH 
3 constant ICAT_AUX_ADDRESS_WIDTH 
8 constant ICAT_AUX_WORD_WIDTH 
5 constant ICAT_AUX_TEMP_UPDATE_ADDR 
0 constant ICAT_AUX_TEMP_UPDATE_DISABLE 
1 constant ICAT_AUX_TEMP_UPDATE_ENABLE 
2 constant ICAT_AUX_TEMP_UPDATE_CONTINUOUS 
2 constant ICAT_AUX_BUS_ADDR 
6 constant ICAT_AUX_ATTEN_ADDR 
7 constant ICAT_AUX_ALT_RELAY_ADDR 
18 constant ICAT_NOISE_FILTER_COEFF_WIDTH 
62 constant ICAT_NOISE_FILTER_ORDER 
1 constant ICAT_NOISE_FILTER_SYMMETRIC 
8 constant ICAT_LED_WIDTH 
16 constant ICAT_DAC_WIDTH 
16 constant ICAT_PHASE_WIDTH 
16 constant ICAT_AMP_WIDTH 
4 constant ICAT_FIFO_GATE_HI_LO_SELECT 
8 constant ICAT_FIFO_GATE_WIDTH 
24 constant ICAT_DATA_WIDTH 
16 constant ICAT_SPI_DATA_WIDTH 
14 constant ICAT_SPI_ADDRESS_WIDTH 
16 constant ICAT_TEMP_AVG_WINDOW 
8 constant ICAT_TEMP_INT_WIDTH 
8 constant ICAT_TEMP_FRAC_WIDTH 
0 constant ICAT_TEMP_COMP_TABLE_PHASETC_DEFAULT 
32768 constant ICAT_TEMP_COMP_TABLE_AMPTC_DEFAULT 
0 constant ICAT_TEMP_COMP_TABLE_DELAYTC_DEFAULT 
32768 constant ICAT_TEMP_COMP_TABLE_SINEGAINTC_DEFAULT 
32768 constant ICAT_TEMP_COMP_TABLE_AMPGAINTC_DEFAULT 
0 constant ICAT_TEMP_COMP_TABLE_AMPNULLTC_DEFAULT 
0 constant ICAT_TEMP_COMP_TABLE_FGDTC_DEFAULT 
1 constant ICAT_TEMP_COMP_TABLE_PHASETC_POSITION 
0 constant ICAT_TEMP_COMP_TABLE_AMPTC_POSITION 
2 constant ICAT_TEMP_COMP_TABLE_DELAYTC_POSITION 
5 constant ICAT_TEMP_COMP_TABLE_SINEGAINTC_POSITION 
3 constant ICAT_TEMP_COMP_TABLE_AMPGAINTC_POSITION 
4 constant ICAT_TEMP_COMP_TABLE_AMPNULLTC_POSITION 
6 constant ICAT_TEMP_COMP_TABLE_FGDTC_POSITION 
16 constant ICAT_NUM_TEMP_COMP_TABLES 
512 constant ICAT_TEMP_COMP_TABLE_DEPTH 
24 constant ICAT_NUM_TEST_POINTS 
32 constant ICAT_NUM_MICTOR_IO 
6 constant ICAT_TRANSCEIVER_ENABLE_WIDTH 
48047 constant CHECKSUM
0x0 constant ID_offset
0x4 constant LED_offset
0x8 constant BoardAddress_offset
0xC constant InterfaceType_offset
0x10 constant Failure_offset
0x14 constant DMARequest_offset
0x18 constant SCLKClockControl_offset
0x1C constant SCLKClockStatus_offset
0x20 constant FIFOControl_offset
0x24 constant FIFOStatus_offset
0x28 constant InstructionFIFOHighThreshold_offset
0x2C constant InstructionFIFOLowThreshold_offset
0x30 constant InstructionFIFOCount_offset
0x34 constant DataFIFOCount_offset
0x38 constant ClearCumulativeDuration_offset
0x3C constant CumulativeDurationLow_offset
0x40 constant CumulativeDurationHigh_offset
0x44 constant J1COutput_offset
0x48 constant J1CEnable_offset
0x4C constant J1CInput_offset
0x50 constant J2COutput_offset
0x54 constant J2CEnable_offset
0x58 constant J2CInput_offset
0x5C constant InterruptStatus_offset
0x60 constant InterruptEnable_offset
0x64 constant InterruptClear_offset
0x68 constant InstructionFifoCountTotal_offset
0x6C constant ClearInstructionFifoCountTotal_offset
0x70 constant InvalidOpcode_offset
0x74 constant AMTRead_offset
0x78 constant XOutDelay_offset
0x7C constant PhaseDelay_offset
0x80 constant AmpDelay_offset
0x84 constant PhaseBias_offset
0x88 constant AmpBias_offset
0x8C constant CalibratePhase_offset
0x90 constant SoftwarePhase_offset
0x94 constant SoftwareAmp_offset
0x98 constant SoftwareGates_offset
0x9C constant SoftwareUser_offset
0xA0 constant SoftwareAUX_offset
0xA4 constant SoftwareAUXReset_offset
0xA8 constant SoftwareAUXStrobe_offset
0xAC constant FIFOOutputSelect_offset
0xB0 constant FIFOPhase_offset
0xB4 constant FIFOAmp_offset
0xB8 constant FIFOGates_offset
0xBC constant FIFOUser_offset
0xC0 constant FIFOAUX_offset
0xC4 constant AUXRead_offset
0xC8 constant Duration_offset
0xCC constant Gates_offset
0xD0 constant Phase_offset
0xD4 constant PhaseIncrement_offset
0xD8 constant PhaseCount_offset
0xDC constant PhaseClear_offset
0xE0 constant PhaseC_offset
0xE4 constant PhaseCIncrement_offset
0xE8 constant PhaseCCount_offset
0xEC constant PhaseCClear_offset
0xF0 constant Amp_offset
0xF4 constant AmpIncrement_offset
0xF8 constant AmpCount_offset
0xFC constant AmpClear_offset
0x100 constant AmpScale_offset
0x104 constant AmpScaleIncrement_offset
0x108 constant AmpScaleCount_offset
0x10C constant AmpScaleClear_offset
0x110 constant User_offset
0x114 constant FIFOInstructionWrite_offset
0x118 constant XmitSpiOut_offset
0x11C constant XmitSpiIn_offset
0x120 constant ClearChecksums_offset
0x124 constant PhaseChecksum_offset
0x128 constant AmpChecksum_offset
0x12C constant FifoGateChecksum_offset
0x130 constant TXDChecksum_offset
0x134 constant InvalidInstruction_offset
0x138 constant TransmitterMode_offset
0x13C constant DCMRst_offset
0x140 constant EnableInterfaceRobustness_offset
0x144 constant InterfaceRobustnessPeriod_offset
0x148 constant P2Delay_offset
0x14C constant LoopBufferControl_offset
0x150 constant NumLoops_offset
0x154 constant LoopBufferStatus_offset
0x158 constant LoopInstructionWrite_offset
0x15C constant LinearizationControl_offset
0x160 constant LinearizedAmpValue_offset
0x164 constant LinearizedPhaseValue_offset
0x168 constant CurrentAtten_offset
0x16C constant CurrentLinearizationTable_offset
0x170 constant CurrentMappedAtten_offset
0x174 constant LinearizedAmpScale_offset
0x400 constant AttenMappingTable_offset
0x800 constant TPowerMappingTable_offset
0xC00 constant LinearizationScaleTable_offset
0x4000 constant AmpLinearizationTable_offset
0x8000 constant PhaseLinearizationTable_offset
0x0 constant ID_addr 
0 constant ID_pos 
4 constant ID_width 
0x0 constant revision_addr 
4 constant revision_pos 
4 constant revision_width 
0x0 constant checksum_addr 
8 constant checksum_pos 
16 constant checksum_width 
0x4 constant led_addr 
0 constant led_pos 
6 constant led_width 
0x8 constant bd_addr_addr 
0 constant bd_addr_pos 
5 constant bd_addr_width 
0xC constant type_addr_addr 
0 constant type_addr_pos 
3 constant type_addr_width 
0x10 constant sw_failure_addr 
0 constant sw_failure_pos 
1 constant sw_failure_width 
0x10 constant sw_warning_addr 
1 constant sw_warning_pos 
1 constant sw_warning_width 
0x14 constant dma_request_addr 
0 constant dma_request_pos 
1 constant dma_request_width 
0x18 constant sclk_rst_addr 
0 constant sclk_rst_pos 
1 constant sclk_rst_width 
0x18 constant sclk_psincdec_addr 
1 constant sclk_psincdec_pos 
1 constant sclk_psincdec_width 
0x18 constant sclk_psen_addr 
2 constant sclk_psen_pos 
1 constant sclk_psen_width 
0x18 constant sclk_psclk_addr 
3 constant sclk_psclk_pos 
1 constant sclk_psclk_width 
0x1C constant sclk_locked_addr 
0 constant sclk_locked_pos 
1 constant sclk_locked_width 
0x1C constant sclk_psdone_addr 
1 constant sclk_psdone_pos 
1 constant sclk_psdone_width 
0x1C constant sclk_status_addr 
2 constant sclk_status_pos 
3 constant sclk_status_width 
0x1C constant sclk_psidle_addr 
5 constant sclk_psidle_pos 
1 constant sclk_psidle_width 
0x20 constant fifo_start_addr 
0 constant fifo_start_pos 
1 constant fifo_start_width 
0x20 constant fifo_sync_start_addr 
1 constant fifo_sync_start_pos 
1 constant fifo_sync_start_width 
0x20 constant fifo_reset_addr 
2 constant fifo_reset_pos 
1 constant fifo_reset_width 
0x24 constant fifo_active_addr 
0 constant fifo_active_pos 
1 constant fifo_active_width 
0x28 constant instruction_fifo_high_threshold_addr 
0 constant instruction_fifo_high_threshold_pos 
13 constant instruction_fifo_high_threshold_width 
0x2C constant instruction_fifo_low_threshold_addr 
0 constant instruction_fifo_low_threshold_pos 
13 constant instruction_fifo_low_threshold_width 
0x30 constant instruction_fifo_count_addr 
0 constant instruction_fifo_count_pos 
13 constant instruction_fifo_count_width 
0x34 constant data_fifo_count_addr 
0 constant data_fifo_count_pos 
9 constant data_fifo_count_width 
0x38 constant clear_cumulative_duration_addr 
0 constant clear_cumulative_duration_pos 
1 constant clear_cumulative_duration_width 
0x3C constant cumulative_duration_low_addr 
0 constant cumulative_duration_low_pos 
32 constant cumulative_duration_low_width 
0x40 constant cumulative_duration_high_addr 
0 constant cumulative_duration_high_pos 
32 constant cumulative_duration_high_width 
0x44 constant J1_C_out_addr 
0 constant J1_C_out_pos 
32 constant J1_C_out_width 
0x48 constant J1_C_en_addr 
0 constant J1_C_en_pos 
32 constant J1_C_en_width 
0x4C constant J1_C_addr 
0 constant J1_C_pos 
32 constant J1_C_width 
0x50 constant J2_C_out_addr 
0 constant J2_C_out_pos 
32 constant J2_C_out_width 
0x54 constant J2_C_en_addr 
0 constant J2_C_en_pos 
32 constant J2_C_en_width 
0x58 constant J2_C_addr 
0 constant J2_C_pos 
32 constant J2_C_width 
0x5C constant fifo_overflow_status_addr 
0 constant fifo_overflow_status_pos 
1 constant fifo_overflow_status_width 
0x5C constant fifo_underflow_status_addr 
1 constant fifo_underflow_status_pos 
1 constant fifo_underflow_status_width 
0x5C constant fifo_finished_status_addr 
2 constant fifo_finished_status_pos 
1 constant fifo_finished_status_width 
0x5C constant fifo_started_status_addr 
3 constant fifo_started_status_pos 
1 constant fifo_started_status_width 
0x5C constant sw_int_status_addr 
4 constant sw_int_status_pos 
4 constant sw_int_status_width 
0x5C constant fail_int_status_addr 
8 constant fail_int_status_pos 
1 constant fail_int_status_width 
0x5C constant warn_int_status_addr 
9 constant warn_int_status_pos 
1 constant warn_int_status_width 
0x5C constant data_fifo_almost_empty_status_addr 
10 constant data_fifo_almost_empty_status_pos 
1 constant data_fifo_almost_empty_status_width 
0x5C constant instr_fifo_almost_full_status_addr 
11 constant instr_fifo_almost_full_status_pos 
1 constant instr_fifo_almost_full_status_width 
0x5C constant invalid_opcode_int_status_addr 
12 constant invalid_opcode_int_status_pos 
1 constant invalid_opcode_int_status_width 
0x5C constant illegal_duration_int_status_addr 
13 constant illegal_duration_int_status_pos 
1 constant illegal_duration_int_status_width 
0x60 constant fifo_overflow_enable_addr 
0 constant fifo_overflow_enable_pos 
1 constant fifo_overflow_enable_width 
0x60 constant fifo_underflow_enable_addr 
1 constant fifo_underflow_enable_pos 
1 constant fifo_underflow_enable_width 
0x60 constant fifo_finished_enable_addr 
2 constant fifo_finished_enable_pos 
1 constant fifo_finished_enable_width 
0x60 constant fifo_started_enable_addr 
3 constant fifo_started_enable_pos 
1 constant fifo_started_enable_width 
0x60 constant sw_int_enable_addr 
4 constant sw_int_enable_pos 
4 constant sw_int_enable_width 
0x60 constant fail_int_enable_addr 
8 constant fail_int_enable_pos 
1 constant fail_int_enable_width 
0x60 constant warn_int_enable_addr 
9 constant warn_int_enable_pos 
1 constant warn_int_enable_width 
0x60 constant data_fifo_almost_empty_enable_addr 
10 constant data_fifo_almost_empty_enable_pos 
1 constant data_fifo_almost_empty_enable_width 
0x60 constant instr_fifo_almost_full_enable_addr 
11 constant instr_fifo_almost_full_enable_pos 
1 constant instr_fifo_almost_full_enable_width 
0x60 constant invalid_opcode_int_enable_addr 
12 constant invalid_opcode_int_enable_pos 
1 constant invalid_opcode_int_enable_width 
0x60 constant illegal_duration_int_enable_addr 
13 constant illegal_duration_int_enable_pos 
1 constant illegal_duration_int_enable_width 
0x64 constant fifo_overflow_clear_addr 
0 constant fifo_overflow_clear_pos 
1 constant fifo_overflow_clear_width 
0x64 constant fifo_underflow_clear_addr 
1 constant fifo_underflow_clear_pos 
1 constant fifo_underflow_clear_width 
0x64 constant fifo_finished_clear_addr 
2 constant fifo_finished_clear_pos 
1 constant fifo_finished_clear_width 
0x64 constant fifo_started_clear_addr 
3 constant fifo_started_clear_pos 
1 constant fifo_started_clear_width 
0x64 constant sw_int_clear_addr 
4 constant sw_int_clear_pos 
4 constant sw_int_clear_width 
0x64 constant fail_int_clear_addr 
8 constant fail_int_clear_pos 
1 constant fail_int_clear_width 
0x64 constant warn_int_clear_addr 
9 constant warn_int_clear_pos 
1 constant warn_int_clear_width 
0x64 constant data_fifo_almost_empty_clear_addr 
10 constant data_fifo_almost_empty_clear_pos 
1 constant data_fifo_almost_empty_clear_width 
0x64 constant instr_fifo_almost_full_clear_addr 
11 constant instr_fifo_almost_full_clear_pos 
1 constant instr_fifo_almost_full_clear_width 
0x64 constant invalid_opcode_int_clear_addr 
12 constant invalid_opcode_int_clear_pos 
1 constant invalid_opcode_int_clear_width 
0x64 constant illegal_duration_int_clear_addr 
13 constant illegal_duration_int_clear_pos 
1 constant illegal_duration_int_clear_width 
0x68 constant instr_fifo_count_total_addr 
0 constant instr_fifo_count_total_pos 
32 constant instr_fifo_count_total_width 
0x6C constant clear_instr_fifo_count_total_addr 
0 constant clear_instr_fifo_count_total_pos 
1 constant clear_instr_fifo_count_total_width 
0x70 constant invalid_opcode_addr 
0 constant invalid_opcode_pos 
16 constant invalid_opcode_width 
0x74 constant amt_read_addr 
0 constant amt_read_pos 
4 constant amt_read_width 
0x78 constant xout_delay_addr 
0 constant xout_delay_pos 
4 constant xout_delay_width 
0x7C constant phase_delay_addr 
0 constant phase_delay_pos 
4 constant phase_delay_width 
0x80 constant amp_delay_addr 
0 constant amp_delay_pos 
4 constant amp_delay_width 
0x84 constant phase_bias_addr 
0 constant phase_bias_pos 
16 constant phase_bias_width 
0x88 constant amp_bias_addr 
0 constant amp_bias_pos 
16 constant amp_bias_width 
0x8C constant phase_calibration_addr 
0 constant phase_calibration_pos 
1 constant phase_calibration_width 
0x90 constant sw_phase_addr 
0 constant sw_phase_pos 
16 constant sw_phase_width 
0x94 constant sw_amp_addr 
0 constant sw_amp_pos 
16 constant sw_amp_width 
0x98 constant sw_gates_addr 
0 constant sw_gates_pos 
12 constant sw_gates_width 
0x9C constant sw_user_addr 
0 constant sw_user_pos 
3 constant sw_user_width 
0xA0 constant sw_aux_addr 
0 constant sw_aux_pos 
12 constant sw_aux_width 
0xA4 constant sw_aux_reset_addr 
0 constant sw_aux_reset_pos 
1 constant sw_aux_reset_width 
0xA8 constant sw_aux_strobe_addr 
0 constant sw_aux_strobe_pos 
1 constant sw_aux_strobe_width 
0xAC constant fifo_output_select_addr 
0 constant fifo_output_select_pos 
1 constant fifo_output_select_width 
0xB0 constant fifo_phase_addr 
0 constant fifo_phase_pos 
16 constant fifo_phase_width 
0xB4 constant fifo_amp_addr 
0 constant fifo_amp_pos 
16 constant fifo_amp_width 
0xB8 constant fifo_gates_addr 
0 constant fifo_gates_pos 
12 constant fifo_gates_width 
0xBC constant fifo_user_addr 
0 constant fifo_user_pos 
3 constant fifo_user_width 
0xC0 constant fifo_aux_addr 
0 constant fifo_aux_pos 
12 constant fifo_aux_width 
0xC4 constant aux_read_addr 
0 constant aux_read_pos 
8 constant aux_read_width 
0xC8 constant holding_duration_addr 
0 constant holding_duration_pos 
26 constant holding_duration_width 
0xCC constant holding_gates_addr 
0 constant holding_gates_pos 
12 constant holding_gates_width 
0xD0 constant holding_phase_addr 
0 constant holding_phase_pos 
16 constant holding_phase_width 
0xD4 constant holding_phase_increment_addr 
0 constant holding_phase_increment_pos 
16 constant holding_phase_increment_width 
0xD8 constant holding_phase_count_addr 
0 constant holding_phase_count_pos 
9 constant holding_phase_count_width 
0xDC constant holding_phase_clear_addr 
0 constant holding_phase_clear_pos 
1 constant holding_phase_clear_width 
0xE0 constant holding_phase_c_addr 
0 constant holding_phase_c_pos 
16 constant holding_phase_c_width 
0xE4 constant holding_phase_c_increment_addr 
0 constant holding_phase_c_increment_pos 
16 constant holding_phase_c_increment_width 
0xE8 constant holding_phase_c_count_addr 
0 constant holding_phase_c_count_pos 
9 constant holding_phase_c_count_width 
0xEC constant holding_phase_c_clear_addr 
0 constant holding_phase_c_clear_pos 
1 constant holding_phase_c_clear_width 
0xF0 constant holding_amp_addr 
0 constant holding_amp_pos 
16 constant holding_amp_width 
0xF4 constant holding_amp_increment_addr 
0 constant holding_amp_increment_pos 
16 constant holding_amp_increment_width 
0xF8 constant holding_amp_count_addr 
0 constant holding_amp_count_pos 
9 constant holding_amp_count_width 
0xFC constant holding_amp_clear_addr 
0 constant holding_amp_clear_pos 
1 constant holding_amp_clear_width 
0x100 constant holding_amp_scale_addr 
0 constant holding_amp_scale_pos 
16 constant holding_amp_scale_width 
0x104 constant holding_amp_scale_increment_addr 
0 constant holding_amp_scale_increment_pos 
16 constant holding_amp_scale_increment_width 
0x108 constant holding_amp_scale_count_addr 
0 constant holding_amp_scale_count_pos 
9 constant holding_amp_scale_count_width 
0x10C constant holding_amp_scale_clear_addr 
0 constant holding_amp_scale_clear_pos 
1 constant holding_amp_scale_clear_width 
0x110 constant holding_user_addr 
0 constant holding_user_pos 
3 constant holding_user_width 
0x114 constant fifo_instruction_addr 
0 constant fifo_instruction_pos 
32 constant fifo_instruction_width 
0x118 constant xmit_spi_frame_addr 
0 constant xmit_spi_frame_pos 
1 constant xmit_spi_frame_width 
0x118 constant xmit_spi_clk_addr 
1 constant xmit_spi_clk_pos 
1 constant xmit_spi_clk_width 
0x118 constant xmit_spi_data_out_addr 
2 constant xmit_spi_data_out_pos 
1 constant xmit_spi_data_out_width 
0x11C constant xmit_spi_data_in_addr 
0 constant xmit_spi_data_in_pos 
1 constant xmit_spi_data_in_width 
0x120 constant clear_checksum_addr 
0 constant clear_checksum_pos 
1 constant clear_checksum_width 
0x124 constant phase_checksum_addr 
0 constant phase_checksum_pos 
16 constant phase_checksum_width 
0x128 constant amp_checksum_addr 
0 constant amp_checksum_pos 
16 constant amp_checksum_width 
0x12C constant fifo_gate_checksum_addr 
0 constant fifo_gate_checksum_pos 
16 constant fifo_gate_checksum_width 
0x130 constant txd_checksum_addr 
0 constant txd_checksum_pos 
32 constant txd_checksum_width 
0x134 constant invalid_instruction_addr 
0 constant invalid_instruction_pos 
32 constant invalid_instruction_width 
0x138 constant transmitter_mode_addr 
0 constant transmitter_mode_pos 
1 constant transmitter_mode_width 
0x138 constant p2_disable_addr 
1 constant p2_disable_pos 
1 constant p2_disable_width 
0x138 constant console_type_addr 
2 constant console_type_pos 
1 constant console_type_width 
0x13C constant dcm_rst_addr 
0 constant dcm_rst_pos 
1 constant dcm_rst_width 
0x140 constant enable_interface_robustness_addr 
0 constant enable_interface_robustness_pos 
1 constant enable_interface_robustness_width 
0x144 constant interface_robustness_period_addr 
0 constant interface_robustness_period_pos 
16 constant interface_robustness_period_width 
0x148 constant p2_delay_addr 
0 constant p2_delay_pos 
7 constant p2_delay_width 
0x14C constant loop_start_addr 
0 constant loop_start_pos 
1 constant loop_start_width 
0x14C constant clear_loop_buffer_addr 
1 constant clear_loop_buffer_pos 
1 constant clear_loop_buffer_width 
0x14C constant loop_abort_addr 
2 constant loop_abort_pos 
1 constant loop_abort_width 
0x150 constant num_loops_addr 
0 constant num_loops_pos 
32 constant num_loops_width 
0x154 constant loop_buffer_busy_addr 
0 constant loop_buffer_busy_pos 
1 constant loop_buffer_busy_width 
0x154 constant loop_buffer_full_addr 
1 constant loop_buffer_full_pos 
1 constant loop_buffer_full_width 
0x158 constant loop_instruction_addr 
0 constant loop_instruction_pos 
32 constant loop_instruction_width 
0x15C constant linearization_enable_addr 
0 constant linearization_enable_pos 
1 constant linearization_enable_width 
0x160 constant lin_fifo_amp_addr 
0 constant lin_fifo_amp_pos 
16 constant lin_fifo_amp_width 
0x164 constant lin_fifo_phase_addr 
0 constant lin_fifo_phase_pos 
16 constant lin_fifo_phase_width 
0x168 constant current_atten_addr 
0 constant current_atten_pos 
8 constant current_atten_width 
0x16C constant current_linearization_table_addr 
0 constant current_linearization_table_pos 
6 constant current_linearization_table_width 
0x170 constant current_mapped_atten_addr 
0 constant current_mapped_atten_pos 
8 constant current_mapped_atten_width 
0x174 constant lkup_amp_scale_addr 
0 constant lkup_amp_scale_pos 
17 constant lkup_amp_scale_width 
0x400 constant table_index_addr 
0 constant table_index_pos 
6 constant table_index_width 
0x800 constant output_tpower_addr 
0 constant output_tpower_pos 
8 constant output_tpower_width 
0xC00 constant scale_factor_addr 
0 constant scale_factor_pos 
17 constant scale_factor_width 
27284 constant iCAT_CHECKSUM
0x0 constant iCAT_ID_offset
0x1 constant iCAT_Checksum_offset
0x2 constant iCAT_ChipControl_offset
0x3 constant iCAT_ChipStatus_offset
0x4 constant iCAT_LED_offset
0x5 constant iCAT_Reboot_offset
0x6 constant iCAT_RebootAddressLow_offset
0x7 constant iCAT_RebootAddressHigh_offset
0x8 constant iCAT_TimeStampLow_offset
0x9 constant iCAT_TimeStampHigh_offset
0xA constant iCAT_DNA0_offset
0xB constant iCAT_DNA1_offset
0xC constant iCAT_DNA2_offset
0xD constant iCAT_DNA3_offset
0xE constant iCAT_BoardRev_offset
0xF constant iCAT_TestPointLowOutput_offset
0x10 constant iCAT_TestPointLowOutputEnable_offset
0x11 constant iCAT_TestPointLowInput_offset
0x12 constant iCAT_TestPointHighOutput_offset
0x13 constant iCAT_TestPointHighOutputEnable_offset
0x14 constant iCAT_TestPointHighInput_offset
0x15 constant iCAT_MictorLowOutput_offset
0x16 constant iCAT_MictorLowOutputEnable_offset
0x17 constant iCAT_MictorLowInput_offset
0x18 constant iCAT_MictorHighOutput_offset
0x19 constant iCAT_MictorHighOutputEnable_offset
0x1A constant iCAT_MictorHighInput_offset
0x1B constant iCAT_ResetSynchronizer_offset
0x1C constant iCAT_PrimaryDCMTarget_offset
0x1D constant iCAT_PrimaryDCMControl_offset
0x1E constant iCAT_PrimaryDCMStatus_offset
0x1F constant iCAT_PrimaryDCMCurrentPhaseShift_offset
0x20 constant iCAT_TXDDCMTarget_offset
0x21 constant iCAT_TXDDCMControl_offset
0x22 constant iCAT_TXDDCMStatus_offset
0x23 constant iCAT_TXDDCMCurrentPhaseShift_offset
0x24 constant iCAT_TemperatureControl_offset
0x25 constant iCAT_TemperatureStatus_offset
0x26 constant iCAT_TemperatureAcquisitionPeriod_offset
0x27 constant iCAT_CurrentTemperature_offset
0x28 constant iCAT_AverageTemperature_offset
0x29 constant iCAT_Temperature_offset
0x2A constant iCAT_ForcedTemperature_offset
0x2B constant iCAT_DACGainControl_offset
0x2C constant iCAT_SineGainNominal_offset
0x2D constant iCAT_AmpGainNominal_offset
0x2E constant iCAT_AmpNullNominal_offset
0x2F constant iCAT_FineGroupDelayNominal_offset
0x30 constant iCAT_SineGain_offset
0x31 constant iCAT_AmpGain_offset
0x32 constant iCAT_AmpNull_offset
0x33 constant iCAT_FineGroupDelay_offset
0x34 constant iCAT_PhaseTemperatureCoefficient_offset
0x35 constant iCAT_AmpTemperatureCoefficient_offset
0x36 constant iCAT_SineGainTemperatureCoefficient_offset
0x37 constant iCAT_AmpGainTemperatureCoefficient_offset
0x38 constant iCAT_AmpNullTemperatureCoefficient_offset
0x39 constant iCAT_FineGroupDelayTemperatureCoefficient_offset
0x3A constant iCAT_DelayTemperatureCoefficient_offset
0x3B constant iCAT_SynthesizerControl_offset
0x3C constant iCAT_SynthesizerEnableCount_offset
0x3D constant iCAT_SynthesizerOutputBias_offset
0x3E constant iCAT_SynthesizerScaleFrac_offset
0x3F constant iCAT_SynthesizerScaleInt_offset
0x40 constant iCAT_SynthesizerPhaseIncrementLow_offset
0x41 constant iCAT_SynthesizerPhaseIncrementHigh_offset
0x42 constant iCAT_AmpValue_offset
0x43 constant iCAT_SynthesizerValue_offset
0x44 constant iCAT_SynthesizerPhaseLoadLow_offset
0x45 constant iCAT_SynthesizerPhaseLoadHigh_offset
0x46 constant iCAT_SynthesizerPhaseCountLow_offset
0x47 constant iCAT_SynthesizerPhaseCountHigh_offset
0x48 constant iCAT_AmpScale_offset
0x49 constant iCAT_AmpBias_offset
0x4A constant iCAT_AmpInvert_offset
0x4B constant iCAT_CurrentPhase_offset
0x4C constant iCAT_CurrentAmp_offset
0x4D constant iCAT_CurrentFifoGates_offset
0x4E constant iCAT_CurrentFifoAux_offset
0x4F constant iCAT_CompensatedPhase_offset
0x50 constant iCAT_CompensatedAmp_offset
0x51 constant iCAT_ClearChecksums_offset
0x52 constant iCAT_PhaseChecksum_offset
0x53 constant iCAT_AmpChecksum_offset
0x54 constant iCAT_FifoGateChecksum_offset
0x55 constant iCAT_TXDChecksumLow_offset
0x56 constant iCAT_TXDChecksumHigh_offset
0x57 constant iCAT_AmpDelay_offset
0x58 constant iCAT_SineDelay_offset
0x59 constant iCAT_FifoGateDelay_offset
0x5A constant iCAT_AuxDelay_offset
0x5B constant iCAT_AttenDelay_offset
0x5C constant iCAT_DelayDelay_offset
0x5D constant iCAT_XmitLoRiseCutThrough_offset
0x5E constant iCAT_XmitLoFallCutThrough_offset
0x5F constant iCAT_AttenuatorSelect_offset
0x60 constant iCAT_ForceAttenuatorSelect_offset
0x61 constant iCAT_CurrentAttenuatorIndex_offset
0x62 constant iCAT_CurrentAttenuatorValueLow_offset
0x63 constant iCAT_CurrentAttenuatorValueHigh_offset
0x64 constant iCAT_CurrentDelayValue_offset
0x65 constant iCAT_AttenuationCalibration_offset
0x66 constant iCAT_CurrentMappedAttenuatorIndex_offset
0x67 constant iCAT_AuxOverride_offset
0x68 constant iCAT_AuxOverrideValue_offset
0x69 constant iCAT_ForceGates_offset
0x6A constant iCAT_SwapSineAndAmp_offset
0x6B constant iCAT_SineNoiseScaleLow_offset
0x6C constant iCAT_SineNoiseScaleHigh_offset
0x6D constant iCAT_NoiseScaleLow_offset
0x6E constant iCAT_NoiseScaleHigh_offset
0x80 constant iCAT_ShapedNoiseCoefficientTable_offset
0x400 constant iCAT_AttenuatorTable_offset
0x800 constant iCAT_AmpLinearizationTable_offset
0xA00 constant iCAT_AmpGainCompressionTable_offset
0x2000 constant iCAT_TempCompTable_offset
0x0 constant iCAT_ID_addr 
0 constant iCAT_ID_pos 
4 constant iCAT_ID_width 
0x0 constant iCAT_revision_addr 
4 constant iCAT_revision_pos 
4 constant iCAT_revision_width 
0x1 constant iCAT_checksum_addr 
0 constant iCAT_checksum_pos 
16 constant iCAT_checksum_width 
0x2 constant iCAT_hard_reset_addr 
0 constant iCAT_hard_reset_pos 
1 constant iCAT_hard_reset_width 
0x2 constant iCAT_soft_reset_addr 
1 constant iCAT_soft_reset_pos 
1 constant iCAT_soft_reset_width 
0x2 constant iCAT_assert_interrupt_addr 
2 constant iCAT_assert_interrupt_pos 
1 constant iCAT_assert_interrupt_width 
0x2 constant iCAT_assert_tx_fail_addr 
3 constant iCAT_assert_tx_fail_pos 
1 constant iCAT_assert_tx_fail_width 
0x2 constant iCAT_dac_reset_addr 
4 constant iCAT_dac_reset_pos 
1 constant iCAT_dac_reset_width 
0x3 constant iCAT_pwr_fail_addr 
0 constant iCAT_pwr_fail_pos 
1 constant iCAT_pwr_fail_width 
0x4 constant iCAT_led_out_addr 
0 constant iCAT_led_out_pos 
8 constant iCAT_led_out_width 
0x5 constant iCAT_reboot_addr 
0 constant iCAT_reboot_pos 
1 constant iCAT_reboot_width 
0x6 constant iCAT_reboot_low_addr 
0 constant iCAT_reboot_low_pos 
16 constant iCAT_reboot_low_width 
0x7 constant iCAT_reboot_high_addr 
0 constant iCAT_reboot_high_pos 
16 constant iCAT_reboot_high_width 
0x8 constant iCAT_timestamp_low_addr 
0 constant iCAT_timestamp_low_pos 
16 constant iCAT_timestamp_low_width 
0x9 constant iCAT_timestamp_high_addr 
0 constant iCAT_timestamp_high_pos 
16 constant iCAT_timestamp_high_width 
0xA constant iCAT_dna0_addr 
0 constant iCAT_dna0_pos 
16 constant iCAT_dna0_width 
0xB constant iCAT_dna1_addr 
0 constant iCAT_dna1_pos 
16 constant iCAT_dna1_width 
0xC constant iCAT_dna2_addr 
0 constant iCAT_dna2_pos 
16 constant iCAT_dna2_width 
0xD constant iCAT_dna3_addr 
0 constant iCAT_dna3_pos 
16 constant iCAT_dna3_width 
0xE constant iCAT_board_rev_addr 
0 constant iCAT_board_rev_pos 
3 constant iCAT_board_rev_width 
0xF constant iCAT_tp_low_out_addr 
0 constant iCAT_tp_low_out_pos 
16 constant iCAT_tp_low_out_width 
0x10 constant iCAT_tp_low_en_addr 
0 constant iCAT_tp_low_en_pos 
16 constant iCAT_tp_low_en_width 
0x11 constant iCAT_tp_low_addr 
0 constant iCAT_tp_low_pos 
16 constant iCAT_tp_low_width 
0x12 constant iCAT_tp_high_out_addr 
0 constant iCAT_tp_high_out_pos 
8 constant iCAT_tp_high_out_width 
0x13 constant iCAT_tp_high_en_addr 
0 constant iCAT_tp_high_en_pos 
8 constant iCAT_tp_high_en_width 
0x14 constant iCAT_tp_high_addr 
0 constant iCAT_tp_high_pos 
8 constant iCAT_tp_high_width 
0x15 constant iCAT_mictor_low_out_addr 
0 constant iCAT_mictor_low_out_pos 
16 constant iCAT_mictor_low_out_width 
0x16 constant iCAT_mictor_low_en_addr 
0 constant iCAT_mictor_low_en_pos 
16 constant iCAT_mictor_low_en_width 
0x17 constant iCAT_mictor_low_addr 
0 constant iCAT_mictor_low_pos 
16 constant iCAT_mictor_low_width 
0x18 constant iCAT_mictor_high_out_addr 
0 constant iCAT_mictor_high_out_pos 
16 constant iCAT_mictor_high_out_width 
0x19 constant iCAT_mictor_high_en_addr 
0 constant iCAT_mictor_high_en_pos 
16 constant iCAT_mictor_high_en_width 
0x1A constant iCAT_mictor_high_addr 
0 constant iCAT_mictor_high_pos 
16 constant iCAT_mictor_high_width 
0x1B constant iCAT_txd_sync_reset_addr 
0 constant iCAT_txd_sync_reset_pos 
1 constant iCAT_txd_sync_reset_width 
0x1B constant iCAT_primary_sync_reset_addr 
1 constant iCAT_primary_sync_reset_pos 
1 constant iCAT_primary_sync_reset_width 
0x1C constant iCAT_primary_phase_shift_addr 
0 constant iCAT_primary_phase_shift_pos 
9 constant iCAT_primary_phase_shift_width 
0x1D constant iCAT_primary_reset_addr 
0 constant iCAT_primary_reset_pos 
1 constant iCAT_primary_reset_width 
0x1E constant iCAT_primary_locked_addr 
0 constant iCAT_primary_locked_pos 
1 constant iCAT_primary_locked_width 
0x1E constant iCAT_primary_psidle_addr 
1 constant iCAT_primary_psidle_pos 
1 constant iCAT_primary_psidle_width 
0x1E constant iCAT_primary_status_addr 
2 constant iCAT_primary_status_pos 
3 constant iCAT_primary_status_width 
0x1E constant iCAT_primary_lost_locked_addr 
5 constant iCAT_primary_lost_locked_pos 
1 constant iCAT_primary_lost_locked_width 
0x1F constant iCAT_primary_current_phase_shift_addr 
0 constant iCAT_primary_current_phase_shift_pos 
9 constant iCAT_primary_current_phase_shift_width 
0x20 constant iCAT_txd_phase_shift_addr 
0 constant iCAT_txd_phase_shift_pos 
9 constant iCAT_txd_phase_shift_width 
0x21 constant iCAT_txd_reset_addr 
0 constant iCAT_txd_reset_pos 
1 constant iCAT_txd_reset_width 
0x22 constant iCAT_txd_locked_addr 
0 constant iCAT_txd_locked_pos 
1 constant iCAT_txd_locked_width 
0x22 constant iCAT_txd_psidle_addr 
1 constant iCAT_txd_psidle_pos 
1 constant iCAT_txd_psidle_width 
0x22 constant iCAT_txd_status_addr 
2 constant iCAT_txd_status_pos 
3 constant iCAT_txd_status_width 
0x22 constant iCAT_txd_lost_locked_addr 
5 constant iCAT_txd_lost_locked_pos 
1 constant iCAT_txd_lost_locked_width 
0x23 constant iCAT_txd_current_phase_shift_addr 
0 constant iCAT_txd_current_phase_shift_pos 
9 constant iCAT_txd_current_phase_shift_width 
0x24 constant iCAT_acquire_temperature_addr 
0 constant iCAT_acquire_temperature_pos 
1 constant iCAT_acquire_temperature_width 
0x24 constant iCAT_periodic_temperature_acquisition_enable_addr 
1 constant iCAT_periodic_temperature_acquisition_enable_pos 
1 constant iCAT_periodic_temperature_acquisition_enable_width 
0x24 constant iCAT_reset_temp_sense_addr 
2 constant iCAT_reset_temp_sense_pos 
1 constant iCAT_reset_temp_sense_width 
0x24 constant iCAT_force_temperature_addr 
3 constant iCAT_force_temperature_pos 
1 constant iCAT_force_temperature_width 
0x24 constant iCAT_force_temperature_compensation_enable_addr 
4 constant iCAT_force_temperature_compensation_enable_pos 
1 constant iCAT_force_temperature_compensation_enable_width 
0x24 constant iCAT_force_temperature_compensation_disable_addr 
5 constant iCAT_force_temperature_compensation_disable_pos 
1 constant iCAT_force_temperature_compensation_disable_width 
0x25 constant iCAT_temperature_valid_addr 
0 constant iCAT_temperature_valid_pos 
1 constant iCAT_temperature_valid_width 
0x25 constant iCAT_temperature_acquisition_busy_addr 
1 constant iCAT_temperature_acquisition_busy_pos 
1 constant iCAT_temperature_acquisition_busy_width 
0x25 constant iCAT_temperature_counter_overflow_addr 
2 constant iCAT_temperature_counter_overflow_pos 
1 constant iCAT_temperature_counter_overflow_width 
0x25 constant iCAT_temperature_addr 
3 constant iCAT_temperature_pos 
1 constant iCAT_temperature_width 
0x25 constant iCAT_temperature_compensation_enabled_addr 
4 constant iCAT_temperature_compensation_enabled_pos 
1 constant iCAT_temperature_compensation_enabled_width 
0x25 constant iCAT_continuous_update_mode_addr 
5 constant iCAT_continuous_update_mode_pos 
1 constant iCAT_continuous_update_mode_width 
0x26 constant iCAT_temperature_acquisition_period_addr 
0 constant iCAT_temperature_acquisition_period_pos 
16 constant iCAT_temperature_acquisition_period_width 
0x27 constant iCAT_current_temperature_addr 
0 constant iCAT_current_temperature_pos 
16 constant iCAT_current_temperature_width 
0x28 constant iCAT_average_temperature_addr 
0 constant iCAT_average_temperature_pos 
16 constant iCAT_average_temperature_width 
0x29 constant iCAT_measured_temperature_addr 
0 constant iCAT_measured_temperature_pos 
16 constant iCAT_measured_temperature_width 
0x2A constant iCAT_forced_temperature_addr 
0 constant iCAT_forced_temperature_pos 
16 constant iCAT_forced_temperature_width 
0x2B constant iCAT_program_dac_gain_addr 
0 constant iCAT_program_dac_gain_pos 
1 constant iCAT_program_dac_gain_width 
0x2C constant iCAT_sinegainnom_addr 
0 constant iCAT_sinegainnom_pos 
16 constant iCAT_sinegainnom_width 
0x2D constant iCAT_ampgainnom_addr 
0 constant iCAT_ampgainnom_pos 
16 constant iCAT_ampgainnom_width 
0x2E constant iCAT_ampnullnom_addr 
0 constant iCAT_ampnullnom_pos 
16 constant iCAT_ampnullnom_width 
0x2F constant iCAT_fgdnom_addr 
0 constant iCAT_fgdnom_pos 
16 constant iCAT_fgdnom_width 
0x30 constant iCAT_sinegain_addr 
0 constant iCAT_sinegain_pos 
16 constant iCAT_sinegain_width 
0x31 constant iCAT_ampgain_addr 
0 constant iCAT_ampgain_pos 
16 constant iCAT_ampgain_width 
0x32 constant iCAT_ampnull_addr 
0 constant iCAT_ampnull_pos 
16 constant iCAT_ampnull_width 
0x33 constant iCAT_fgd_addr 
0 constant iCAT_fgd_pos 
16 constant iCAT_fgd_width 
0x34 constant iCAT_phasetc_addr 
0 constant iCAT_phasetc_pos 
16 constant iCAT_phasetc_width 
0x35 constant iCAT_amptc_addr 
0 constant iCAT_amptc_pos 
16 constant iCAT_amptc_width 
0x36 constant iCAT_sinegaintc_addr 
0 constant iCAT_sinegaintc_pos 
16 constant iCAT_sinegaintc_width 
0x37 constant iCAT_ampgaintc_addr 
0 constant iCAT_ampgaintc_pos 
16 constant iCAT_ampgaintc_width 
0x38 constant iCAT_ampnulltc_addr 
0 constant iCAT_ampnulltc_pos 
16 constant iCAT_ampnulltc_width 
0x39 constant iCAT_fgdtc_addr 
0 constant iCAT_fgdtc_pos 
16 constant iCAT_fgdtc_width 
0x3A constant iCAT_delaytc_addr 
0 constant iCAT_delaytc_pos 
16 constant iCAT_delaytc_width 
0x3B constant iCAT_enable_phase_counter_addr 
0 constant iCAT_enable_phase_counter_pos 
1 constant iCAT_enable_phase_counter_width 
0x3B constant iCAT_bypass_sine_addr 
1 constant iCAT_bypass_sine_pos 
1 constant iCAT_bypass_sine_width 
0x3B constant iCAT_reset_phase_accum_on_start_addr 
2 constant iCAT_reset_phase_accum_on_start_pos 
1 constant iCAT_reset_phase_accum_on_start_width 
0x3B constant iCAT_digital_scale_mode_addr 
3 constant iCAT_digital_scale_mode_pos 
1 constant iCAT_digital_scale_mode_width 
0x3B constant iCAT_gate_sine_on_receive_addr 
4 constant iCAT_gate_sine_on_receive_pos 
1 constant iCAT_gate_sine_on_receive_width 
0x3B constant iCAT_gate_sine_on_ifoff_addr 
5 constant iCAT_gate_sine_on_ifoff_pos 
1 constant iCAT_gate_sine_on_ifoff_width 
0x3C constant iCAT_enable_count_addr 
0 constant iCAT_enable_count_pos 
16 constant iCAT_enable_count_width 
0x3D constant iCAT_bias_addr 
0 constant iCAT_bias_pos 
16 constant iCAT_bias_width 
0x3E constant iCAT_alpha_frac_addr 
0 constant iCAT_alpha_frac_pos 
16 constant iCAT_alpha_frac_width 
0x3F constant iCAT_alpha_int_addr 
0 constant iCAT_alpha_int_pos 
1 constant iCAT_alpha_int_width 
0x40 constant iCAT_phase_increment_low_addr 
0 constant iCAT_phase_increment_low_pos 
16 constant iCAT_phase_increment_low_width 
0x41 constant iCAT_phase_increment_high_addr 
0 constant iCAT_phase_increment_high_pos 
16 constant iCAT_phase_increment_high_width 
0x42 constant iCAT_dac0_addr 
0 constant iCAT_dac0_pos 
16 constant iCAT_dac0_width 
0x43 constant iCAT_dac1_addr 
0 constant iCAT_dac1_pos 
16 constant iCAT_dac1_width 
0x44 constant iCAT_phase_load_low_addr 
0 constant iCAT_phase_load_low_pos 
16 constant iCAT_phase_load_low_width 
0x45 constant iCAT_phase_load_high_addr 
0 constant iCAT_phase_load_high_pos 
16 constant iCAT_phase_load_high_width 
0x46 constant iCAT_phase_count_low_addr 
0 constant iCAT_phase_count_low_pos 
16 constant iCAT_phase_count_low_width 
0x47 constant iCAT_phase_count_high_addr 
0 constant iCAT_phase_count_high_pos 
16 constant iCAT_phase_count_high_width 
0x48 constant iCAT_amp_scale_addr 
0 constant iCAT_amp_scale_pos 
16 constant iCAT_amp_scale_width 
0x49 constant iCAT_amp_bias_addr 
0 constant iCAT_amp_bias_pos 
16 constant iCAT_amp_bias_width 
0x4A constant iCAT_amp_invert_addr 
0 constant iCAT_amp_invert_pos 
16 constant iCAT_amp_invert_width 
0x4B constant iCAT_phase_addr 
0 constant iCAT_phase_pos 
16 constant iCAT_phase_width 
0x4C constant iCAT_amp_addr 
0 constant iCAT_amp_pos 
16 constant iCAT_amp_width 
0x4D constant iCAT_fifo_gate_addr 
0 constant iCAT_fifo_gate_pos 
8 constant iCAT_fifo_gate_width 
0x4E constant iCAT_aux_addr 
0 constant iCAT_aux_pos 
6 constant iCAT_aux_width 
0x4F constant iCAT_adjusted_phase_addr 
0 constant iCAT_adjusted_phase_pos 
16 constant iCAT_adjusted_phase_width 
0x50 constant iCAT_adjusted_amp_addr 
0 constant iCAT_adjusted_amp_pos 
16 constant iCAT_adjusted_amp_width 
0x51 constant iCAT_clear_checksum_addr 
0 constant iCAT_clear_checksum_pos 
1 constant iCAT_clear_checksum_width 
0x52 constant iCAT_phase_checksum_addr 
0 constant iCAT_phase_checksum_pos 
16 constant iCAT_phase_checksum_width 
0x53 constant iCAT_amp_checksum_addr 
0 constant iCAT_amp_checksum_pos 
16 constant iCAT_amp_checksum_width 
0x54 constant iCAT_fifo_gate_checksum_addr 
0 constant iCAT_fifo_gate_checksum_pos 
16 constant iCAT_fifo_gate_checksum_width 
0x55 constant iCAT_txd_checksum_low_addr 
0 constant iCAT_txd_checksum_low_pos 
16 constant iCAT_txd_checksum_low_width 
0x56 constant iCAT_txd_checksum_high_addr 
0 constant iCAT_txd_checksum_high_pos 
16 constant iCAT_txd_checksum_high_width 
0x57 constant iCAT_amp_delay_addr 
0 constant iCAT_amp_delay_pos 
6 constant iCAT_amp_delay_width 
0x58 constant iCAT_sine_delay_addr 
0 constant iCAT_sine_delay_pos 
6 constant iCAT_sine_delay_width 
0x59 constant iCAT_fifo_gate_delay_addr 
0 constant iCAT_fifo_gate_delay_pos 
6 constant iCAT_fifo_gate_delay_width 
0x5A constant iCAT_aux_delay_addr 
0 constant iCAT_aux_delay_pos 
6 constant iCAT_aux_delay_width 
0x5B constant iCAT_atten_delay_addr 
0 constant iCAT_atten_delay_pos 
6 constant iCAT_atten_delay_width 
0x5C constant iCAT_delay_delay_addr 
0 constant iCAT_delay_delay_pos 
6 constant iCAT_delay_delay_width 
0x5D constant iCAT_xmit_lo_rise_cut_through_addr 
0 constant iCAT_xmit_lo_rise_cut_through_pos 
2 constant iCAT_xmit_lo_rise_cut_through_width 
0x5E constant iCAT_xmit_lo_fall_cut_through_addr 
0 constant iCAT_xmit_lo_fall_cut_through_pos 
2 constant iCAT_xmit_lo_fall_cut_through_width 
0x5F constant iCAT_atten_entry_select_addr 
0 constant iCAT_atten_entry_select_pos 
9 constant iCAT_atten_entry_select_width 
0x60 constant iCAT_force_atten_entry_select_addr 
0 constant iCAT_force_atten_entry_select_pos 
1 constant iCAT_force_atten_entry_select_width 
0x61 constant iCAT_atten_index_addr 
0 constant iCAT_atten_index_pos 
9 constant iCAT_atten_index_width 
0x62 constant iCAT_atten_low_addr 
0 constant iCAT_atten_low_pos 
16 constant iCAT_atten_low_width 
0x63 constant iCAT_atten_high_addr 
0 constant iCAT_atten_high_pos 
8 constant iCAT_atten_high_width 
0x64 constant iCAT_delay_addr 
0 constant iCAT_delay_pos 
7 constant iCAT_delay_width 
0x65 constant iCAT_atten_calibration_addr 
0 constant iCAT_atten_calibration_pos 
8 constant iCAT_atten_calibration_width 
0x66 constant iCAT_mapped_atten_index_addr 
0 constant iCAT_mapped_atten_index_pos 
9 constant iCAT_mapped_atten_index_width 
0x67 constant iCAT_aux_override_addr 
0 constant iCAT_aux_override_pos 
1 constant iCAT_aux_override_width 
0x68 constant iCAT_aux_override_value_addr 
0 constant iCAT_aux_override_value_pos 
6 constant iCAT_aux_override_value_width 
0x69 constant iCAT_forced_gate_value_addr 
0 constant iCAT_forced_gate_value_pos 
8 constant iCAT_forced_gate_value_width 
0x69 constant iCAT_forced_gate_mask_addr 
8 constant iCAT_forced_gate_mask_pos 
8 constant iCAT_forced_gate_mask_width 
0x6A constant iCAT_swap_sine_and_amp_addr 
0 constant iCAT_swap_sine_and_amp_pos 
1 constant iCAT_swap_sine_and_amp_width 
0x6B constant iCAT_sine_scale_low_addr 
0 constant iCAT_sine_scale_low_pos 
16 constant iCAT_sine_scale_low_width 
0x6C constant iCAT_sine_scale_high_addr 
0 constant iCAT_sine_scale_high_pos 
5 constant iCAT_sine_scale_high_width 
0x6D constant iCAT_noise_scale_low_addr 
0 constant iCAT_noise_scale_low_pos 
16 constant iCAT_noise_scale_low_width 
0x6E constant iCAT_noise_scale_high_addr 
0 constant iCAT_noise_scale_high_pos 
3 constant iCAT_noise_scale_high_width 
0x80 constant iCAT_coefficient_addr 
0 constant iCAT_coefficient_pos 
18 constant iCAT_coefficient_width 
0x400 constant iCAT_atten_addr 
0 constant iCAT_atten_pos 
24 constant iCAT_atten_width 
0x400 constant iCAT_delay_addr 
24 constant iCAT_delay_pos 
7 constant iCAT_delay_width 
0x800 constant iCAT_replacement_amplitude_addr 
0 constant iCAT_replacement_amplitude_pos 
16 constant iCAT_replacement_amplitude_width 
0xA00 constant iCAT_atten_point_addr 
0 constant iCAT_atten_point_pos 
16 constant iCAT_atten_point_width 
0x2000 constant iCAT_tcomp_segment_endpoint_addr 
0 constant iCAT_tcomp_segment_endpoint_pos 
16 constant iCAT_tcomp_segment_endpoint_width 
: SetDuration 0 swap 31 lshift or 1 26 lshift or swap 0 lshift or ;
: SetGates 0 swap 31 lshift or 2 26 lshift or swap 12 lshift or swap 0 lshift or ;
: SetPhase 0 swap 31 lshift or 4 26 lshift or swap 25 lshift or swap 16 lshift or swap 0 lshift or ;
: SetPhaseC 0 swap 31 lshift or 5 26 lshift or swap 25 lshift or swap 16 lshift or swap 0 lshift or ;
: SetAmp 0 swap 31 lshift or 6 26 lshift or swap 25 lshift or swap 16 lshift or swap 0 lshift or ;
: SetAmpScale 0 swap 31 lshift or 7 26 lshift or swap 25 lshift or swap 16 lshift or swap 0 lshift or ;
: SetUser 0 swap 31 lshift or 8 26 lshift or swap 0 lshift or ;
: SetAux 0 swap 31 lshift or 9 26 lshift or swap 8 lshift or swap 0 lshift or ;
: NoOp 0 swap 31 lshift or 0 26 lshift or ;
: encode-set-duration ( duration write - instruction )
  SetDuration
;

: encode-set-gates ( mask gates write - instruction )
  SetGates
;

: encode-set-phase ( phase write - instruction )
  0 swap 0 swap SetPhase
;

: encode-set-phase-increment ( increment count clear write - instruction )
  SetPhase
;

: encode-set-phase-c ( phase-c write - instruction )
;

: encode-set-phase-c-increment ( count increment clear write - instruction )
  SetPhaseC
;

: encode-set-amp ( amp write - instruction )
  0 swap 0 swap SetAmp
;

: encode-set-amp-increment ( increment count clear write - instruction )
  SetAmp
;

: encode-set-amp-scale ( amp-scale write - instruction )
  0 swap 0 swap SetAmpScale
;

: encode-set-amp-scale-increment ( increment count clear write - instruction )
  SetAmpScale
;

: encode-set-aux ( data addr write - instruction )
  SetAux
;

: decode-write-bit
  31 rshift .
;

: decode-phase-amp-opts
  dup 0xffff and x.
  dup 16 rshift 0x1ff and x.
  25 rshift 1 and .  
;

: decode-set-duration
  dup 1 26 lshift 1- and .
  decode-write-bit
  ." set-duration "
;

: decode-set-gates
  dup 0xfff and x.
  dup 12 rshift 0xfff and x.
  decode-write-bit
  ." set-gates "
;

: decode-set-phase
  dup decode-phase-amp-opts
  decode-write-bit
  ." set-phase "
;

: decode-set-phase-c
  dup decode-phase-amp-opts
  decode-write-bit
  ." set-phase-c "
;

: decode-set-amp
  dup decode-phase-amp-opts
  decode-write-bit
  ." set-amp "
;

: decode-set-amp-scale
  dup decode-phase-amp-opts
  decode-write-bit
  ." set-amp-scale "
;

: decode-set-user
  dup 0xff and x.
  decode-write-bit
  ." set-user "
;

: decode-set-aux
  dup 0xff and x.
  dup 8 rshift 0xf and x.
  decode-write-bit
  ." set-aux "
;

: decode-instruction
  dup 26 rshift 31 and
  case
    1 of decode-set-duration endof
    2 of decode-set-gates endof
    4 of decode-set-phase endof
    5 of decode-set-phase-c endof
    6 of decode-set-amp endof
    7 of decode-set-amp-scale endof
    8 of decode-set-user endof
    9 of decode-set-aux endof
    0 of ." NoOp " endof
    ." unknown instruction " x.
  endcase
  cr
;

: fpga! fpga + ! ;

fpga fifo_instruction_addr + constant fifo

: fifo! fifo ! ;

fpga loop_instruction_addr + constant loop-fifo


: hw-outputs
  1 fifo_output_select_addr fpga!
;

: sw-outputs
  0 fifo_output_select_addr fpga!
;

: start-fifo
  hw-outputs
  0 fifo_start_addr fpga!
  1 fifo_start_addr fpga!
;

: commit-fifo
    0 1 SetDuration fifo!
  start-fifo
;

: reset-fifo
  fpga FIFOControl_offset + dup
  4 swap !
  0 swap !
;

create loop-buffer
4096 cells allot
variable loop-ptr 

variable loop-count

: clear-loop
  0 loop-count !
  loop-buffer loop-ptr !
  1 clear_loop_buffer_pos lshift clear_loop_buffer_addr fpga!
  0 clear_loop_buffer_addr fpga!
;

clear-loop

: abort-loop
  0 loop-count !
  1 loop_abort_pos lshift loop_abort_addr fpga!
  0 loop_abort_addr fpga!
;

variable seq-debug
0 seq-debug !

: loop!
  seq-debug @ if dup decode-instruction then
  dup loop-ptr @ !
  loop-ptr @ 1 cells + loop-ptr !
  loop_instruction_addr fpga!
  loop-count dup @ 1+ swap !
;

: print-loop
  loop-count @ 0 do
    loop-buffer i cells + @ decode-instruction
  loop
;

: set-num-loops
  num_loops_addr fpga!
;

: seq-phase
  0 0 0 SetPhase loop!
;

: seq-amp
  0 0 0 SetAmp loop!
;

: seq-amp-scale
  0 0 0 SetAmpScale loop!
;

: seq-gates
  0x3f 0 SetGates loop!
;

: seq-atten-index
  6 1 SetAux loop!
;

: seq-aux
  7 1 SetAux loop!
;

: seq-delay
  1 SetDuration loop!
;

: seq-ms 200 /mod 0 do 200 80000 * seq-delay loop dup 0 <> if 80000 * seq-delay then ;
 
: seq-if-on
  8 8 0 SetGates loop!
;

: seq-if-off
  0 8 0 SetGates loop!
;

: seq-xmtlo-on
  0 2 0 SetGates loop!
;

: seq-xmtlo-off
  2 2 0 SetGates loop!
;

: seq-xmtout-on
  4 4 0 SetGates loop!
;

: seq-xmtout-off
  0 4 0 SetGates loop!
;

: seq-rcvlo-on 
  0 1 0 SetGates loop!
;

: seq-rcvlo-off
  1 1 SetGates loop!
;

: icat-seconds iCAT_TimeStampHigh_offset spi@ 16 lshift iCAT_TimeStampLow_offset spi@ or ;

: get-seconds ( s-time -- seconds m-time ) dup 60 mod swap 60 / ;

: get-minutes ( m-time -- minutes h-time ) dup 60 mod swap 60 / ;

: get-hours ( h-time -- hours d-time ) dup 24 mod swap 24 / ;

: get-quad-day ( d-time -- quad-days q-time )dup 1461 mod swap 1461 / ; \ will break after Feb 28 2100.

create month-len 31 , 28 , 31 , 30 , 31 , 30 , 31 , 31 , 30 , 31 , 30 , 31 ,

create leap-month-len 31 , 29 , 31 , 30 , 31 , 30 , 31 , 31 , 30 , 31 , 30 , 31 ,

: month-len@ ( month-len month - days )
  cells + @
;

: leap-year?
  4 mod 0 = \ 32-bit number of seconds since 1970 means we don't need anything more complicated
;

: select-proper-month-len-list ( year -- month-len )
  leap-year? if leap-month-len else month-len then
;

: month ( year days - day-in-month month )
  swap select-proper-month-len-list
  12 0 do \ days month-len
    tuck i month-len@ \ month-len day-of-year length-of-month
    tuck \ month-len length-of-month day-of-year length-of-month
    - \ month-len length-of-month adj-day-of-year
    dup 0< if
      + \ month-len day-of-month
      nip \ day-of-month
      i \ day-of-month month
      leave
    then
    nip
    swap
  loop
;

: print-num
  s>D <# #s #> type
;

: print-date ( sec min hour day month year -- )
  print-num [char] / emit
  1+ print-num [char] / emit
  1+ print-num bl emit
  print-num [char] : emit
  print-num [char] : emit
  print-num 
;

: gen-build-date
  get-seconds \ seconds m-time
  get-minutes \ seconds minutes h-time
  get-hours \ seconds minutes hours d-time
  get-quad-day \ seconds minutes hours days-in-quad q-time
  4 * \ seconds minutes hours days-in-quad quad-years
  swap tuck \ seconds minutes hours days-in-quad quad-years days-in-quad
  dup 365 >= if
    365 -
    swap 1+ swap
    dup 365 >= if
      365 -
      swap 1+ swap
      dup 366 >= if
        366 -
        swap 1+ swap
        dup 365 >= if
          365 -
          swap 1+ swap
        then
      then
    then
  then \ seconds minutes hours days-in-quad years day-in-year
  rot drop \ seconds minutes hours years days-in-year
  swap 1970 + tuck \ seconds minutes hours year day-in-year year
  swap month \ seconds minutes hours year day-in-month month
  rot \ seconds minutes hours day-in-month month year 
;

: print-build-date
  ." Compiled:"
  icat-seconds gen-build-date print-date
  cr
;
1 constant icat_validation.4th
.( loading iCAT Validation routines ) cr


: get-revision
  iCAT_revision_addr spi@
  iCAT_revision_pos rshift
  1 iCAT_revision_width lshift 1 - and
;

: get-checksum
  iCAT_checksum_addr spi@
;

: check-checksum
  get-checksum iCAT_CHECKSUM <>
  if
    ." ***Warning iCAT checksum "
    get-checksum x.
    ."  does not match expected checksum "
    iCAT_CHECKSUM x.
    cr
  then
;

: get-dna ( - LSW MSW )
  iCAT_dna0_addr spi@	
  iCAT_dna1_addr spi@ 16 lshift or
  iCAT_dna2_addr spi@
  iCAT_dna3_addr spi@ 16 lshift or
;

: print-dna
  base @ 16 base ! get-dna <# #s #> type base !
;

: get-board-rev
  iCAT_board_rev_addr spi@
;

: soft-reset
  1 iCAT_soft_reset_pos lshift iCAT_soft_reset_addr  spi!
;

: hard-reset
  1 iCAT_hard_reset_pos lshift iCAT_hard_reset_addr  spi!
;  

: boot-to-primary
  0 iCAT_reboot_low_addr spi!
  0 iCAT_reboot_high_addr spi!
  1 iCAT_reboot_addr spi!
;

: boot-to-secondary
  0 iCAT_reboot_low_addr spi!
  0xc iCAT_reboot_high_addr spi!
  1 iCAT_reboot_addr spi!
;

: enable-ir 
  1 enable_interface_robustness_addr fpga + !
;

: disable-ir
  0 enable_interface_robustness_addr fpga + !
;

: ir-status
  enable_interface_robustness_addr fpga + @
;

: set-atten-entry ( atten-val index -- )
  2 * iCAT_AttenuatorTable_offset +
  2dup swap 0xffff and swap spi!
  1+
  tuck spi@ 0xff00 and
  swap 16 rshift 0xff and or swap spi!
;


: fset-atten-entry
  2e f* float>int 0x3f and 18 lshift
  2e f* float>int 0x3f and 12 lshift or
  2e f* float>int 0x3f and 6 lshift or
  2e f* float>int 0x3f and or
  swap set-atten-entry
;

: get-atten-entry ( index -- )
  2 * iCAT_AttenuatorTable_offset +
  dup spi@
  swap 1+ spi@ 0xff and 16 lshift
  or
;

: release-atten
  iCAT_ForceAttenuatorSelect_offset spi@
  if
    ." Releasing forced attenuation/delay values. " cr
  then
  0 iCAT_ForceAttenuatorSelect_offset spi!
;

0 constant atten-force-index
: force-atten
  iCAT_ForceAttenuatorSelect_offset spi@
  0 = if
    ." Forcing attenuation/delay values. " cr
  then
  1 iCAT_ForceAttenuatorSelect_offset spi!
  atten-force-index iCAT_AttenuatorSelect_offset spi!  
;

: set-atten-index
  ICAT_AUX_ATTEN_ADDR 1 SetAux fifo!
  commit-fifo
;

: get-atten-index
  iCAT_CurrentAttenuatorIndex_offset spi@
;

: get-mapped-atten-index 
  iCAT_CurrentMappedAttenuatorIndex_offset spi@
;

: get-atten-cal
  iCAT_AttenuationCalibration_offset spi@
;

: set-atten-cal
  iCAT_AttenuationCalibration_offset spi!
;

: set-atten ( atten-val -- )
  dup atten-force-index set-atten-entry
  atten-force-index 256 + set-atten-entry
  force-atten
;

: get-atten ( -- atten-val )
  iCAT_CurrentAttenuatorValueLow_offset spi@
  iCAT_CurrentAttenuatorValueHigh_offset spi@
  16 lshift or
;

: set-atten# ( atten-val atten# -- )
tuck swap 0x3f and swap 6 * lshift
swap get-atten swap 0x3f swap 6 * lshift invert and
or set-atten
;

: fset-atten# ( f:atten-val atten# -- )
2e f* float>int invert swap set-atten#
;

: set-a ( f:atten0 f:atten1 f:atten2 f:atten3 -- )
3 fset-atten#
2 fset-atten#
1 fset-atten#
0 fset-atten#
;

: print-1a
0x3f and int>float 2e f/ f. ." "
;

: print-a ( -- )
get-atten invert
dup print-1a
dup 6 rshift print-1a
dup 6 rshift print-1a
6 rshift print-1a
;

create atten-mapping
256 allot
atten-mapping
0xff swap tuck c!
0xfe swap 1+ tuck c!
0xbf swap 1+ tuck c!
0xbe swap 1+ tuck c!
0xdf swap 1+ tuck c!
0xde swap 1+ tuck c!
0x9f swap 1+ tuck c!
0x9e swap 1+ tuck c!
0xef swap 1+ tuck c!
0xee swap 1+ tuck c!
0xaf swap 1+ tuck c!
0xae swap 1+ tuck c!
0xcf swap 1+ tuck c!
0xce swap 1+ tuck c!
0x8f swap 1+ tuck c!
0x8e swap 1+ tuck c!
0xf7 swap 1+ tuck c!
0xf6 swap 1+ tuck c!
0xb7 swap 1+ tuck c!
0xb6 swap 1+ tuck c!
0xd7 swap 1+ tuck c!
0xd6 swap 1+ tuck c!
0x97 swap 1+ tuck c!
0x96 swap 1+ tuck c!
0xe7 swap 1+ tuck c!
0xe6 swap 1+ tuck c!
0xa7 swap 1+ tuck c!
0xa6 swap 1+ tuck c!
0xc7 swap 1+ tuck c!
0xc6 swap 1+ tuck c!
0x87 swap 1+ tuck c!
0x86 swap 1+ tuck c!
0xfb swap 1+ tuck c!
0xfa swap 1+ tuck c!
0xbb swap 1+ tuck c!
0xba swap 1+ tuck c!
0xdb swap 1+ tuck c!
0xda swap 1+ tuck c!
0x9b swap 1+ tuck c!
0x9a swap 1+ tuck c!
0xeb swap 1+ tuck c!
0xea swap 1+ tuck c!
0xab swap 1+ tuck c!
0xaa swap 1+ tuck c!
0xcb swap 1+ tuck c!
0xca swap 1+ tuck c!
0x8b swap 1+ tuck c!
0x8a swap 1+ tuck c!
0xf3 swap 1+ tuck c!
0xf2 swap 1+ tuck c!
0xb3 swap 1+ tuck c!
0xb2 swap 1+ tuck c!
0xd3 swap 1+ tuck c!
0xd2 swap 1+ tuck c!
0x93 swap 1+ tuck c!
0x92 swap 1+ tuck c!
0xe3 swap 1+ tuck c!
0xe2 swap 1+ tuck c!
0xa3 swap 1+ tuck c!
0xa2 swap 1+ tuck c!
0xc3 swap 1+ tuck c!
0xc2 swap 1+ tuck c!
0x83 swap 1+ tuck c!
0x82 swap 1+ tuck c!
0xfd swap 1+ tuck c!
0xfc swap 1+ tuck c!
0xbd swap 1+ tuck c!
0xbc swap 1+ tuck c!
0xdd swap 1+ tuck c!
0xdc swap 1+ tuck c!
0x9d swap 1+ tuck c!
0x9c swap 1+ tuck c!
0xed swap 1+ tuck c!
0xec swap 1+ tuck c!
0xad swap 1+ tuck c!
0xac swap 1+ tuck c!
0xcd swap 1+ tuck c!
0xcc swap 1+ tuck c!
0x8d swap 1+ tuck c!
0x8c swap 1+ tuck c!
0xf5 swap 1+ tuck c!
0xf4 swap 1+ tuck c!
0xb5 swap 1+ tuck c!
0xb4 swap 1+ tuck c!
0xd5 swap 1+ tuck c!
0xd4 swap 1+ tuck c!
0x95 swap 1+ tuck c!
0x94 swap 1+ tuck c!
0xe5 swap 1+ tuck c!
0xe4 swap 1+ tuck c!
0xa5 swap 1+ tuck c!
0xa4 swap 1+ tuck c!
0xc5 swap 1+ tuck c!
0xc4 swap 1+ tuck c!
0x85 swap 1+ tuck c!
0x84 swap 1+ tuck c!
0xf9 swap 1+ tuck c!
0xf8 swap 1+ tuck c!
0xb9 swap 1+ tuck c!
0xb8 swap 1+ tuck c!
0xd9 swap 1+ tuck c!
0xd8 swap 1+ tuck c!
0x99 swap 1+ tuck c!
0x98 swap 1+ tuck c!
0xe9 swap 1+ tuck c!
0xe8 swap 1+ tuck c!
0xa9 swap 1+ tuck c!
0xa8 swap 1+ tuck c!
0xc9 swap 1+ tuck c!
0xc8 swap 1+ tuck c!
0x89 swap 1+ tuck c!
0x88 swap 1+ tuck c!
0xf1 swap 1+ tuck c!
0xf0 swap 1+ tuck c!
0xb1 swap 1+ tuck c!
0xb0 swap 1+ tuck c!
0xd1 swap 1+ tuck c!
0xd0 swap 1+ tuck c!
0x91 swap 1+ tuck c!
0x90 swap 1+ tuck c!
0xe1 swap 1+ tuck c!
0xe0 swap 1+ tuck c!
0xa1 swap 1+ tuck c!
0xa0 swap 1+ tuck c!
0xc1 swap 1+ tuck c!
0xc0 swap 1+ tuck c!
0x81 swap 1+ tuck c!
0x80 swap 1+ tuck c!
0x79 swap 1+ tuck c!
0x78 swap 1+ tuck c!
0x39 swap 1+ tuck c!
0x38 swap 1+ tuck c!
0x59 swap 1+ tuck c!
0x58 swap 1+ tuck c!
0x19 swap 1+ tuck c!
0x18 swap 1+ tuck c!
0x69 swap 1+ tuck c!
0x68 swap 1+ tuck c!
0x29 swap 1+ tuck c!
0x28 swap 1+ tuck c!
0x49 swap 1+ tuck c!
0x48 swap 1+ tuck c!
0x09 swap 1+ tuck c!
0x08 swap 1+ tuck c!
0x71 swap 1+ tuck c!
0x70 swap 1+ tuck c!
0x31 swap 1+ tuck c!
0x30 swap 1+ tuck c!
0x51 swap 1+ tuck c!
0x50 swap 1+ tuck c!
0x11 swap 1+ tuck c!
0x10 swap 1+ tuck c!
0x61 swap 1+ tuck c!
0x60 swap 1+ tuck c!
0x21 swap 1+ tuck c!
0x20 swap 1+ tuck c!
0x41 swap 1+ tuck c!
0x40 swap 1+ tuck c!
0x01 swap 1+ tuck c!
0x43 swap 1+ tuck c!
0x42 swap 1+ tuck c!
0x35 swap 1+ tuck c!
0x34 swap 1+ tuck c!
0x33 swap 1+ tuck c!
0x32 swap 1+ tuck c!
0x3d swap 1+ tuck c!
0x3c swap 1+ tuck c!
0x2d swap 1+ tuck c!
0x2c swap 1+ tuck c!
0x2b swap 1+ tuck c!
0x2a swap 1+ tuck c!
0x4d swap 1+ tuck c!
0x4c swap 1+ tuck c!
0x25 swap 1+ tuck c!
0x24 swap 1+ tuck c!
0x23 swap 1+ tuck c!
0x22 swap 1+ tuck c!
0x75 swap 1+ tuck c!
0x74 swap 1+ tuck c!
0x1d swap 1+ tuck c!
0x1c swap 1+ tuck c!
0x1b swap 1+ tuck c!
0x1a swap 1+ tuck c!
0x55 swap 1+ tuck c!
0x54 swap 1+ tuck c!
0x15 swap 1+ tuck c!
0x14 swap 1+ tuck c!
0x13 swap 1+ tuck c!
0x12 swap 1+ tuck c!
0x65 swap 1+ tuck c!
0x64 swap 1+ tuck c!
0x0d swap 1+ tuck c!
0x0c swap 1+ tuck c!
0x0b swap 1+ tuck c!
0x0a swap 1+ tuck c!
0x45 swap 1+ tuck c!
0x44 swap 1+ tuck c!
0x05 swap 1+ tuck c!
0x04 swap 1+ tuck c!
0x03 swap 1+ tuck c!
0x02 swap 1+ c!

: dB
  iCAT_ForceAttenuatorSelect_offset spi@
  if
    ." Attenuation value is currently forced. " cr
    ." Use release-atten command to remove the forced value " cr
    ." For this dB command to take effect. " cr
  then
  2e f* float>int atten-mapping + c@ set-atten-index
;

: set-delay-entry ( delay-val index -- )
  2 * iCAT_AttenuatorTable_offset + 1+ tuck
  spi@ 0xff and swap 8 lshift or swap spi!
;

: get-delay-entry ( index -- )
  2 * iCAT_AttenuatorTable_offset + 1+ spi@
  8 rshift
;

: set-delay ( delay-val -- )
  dup
  atten-force-index set-delay-entry
  atten-force-index 256 + set-delay-entry
;

: get-delay ( -- delay-val )
  iCAT_CurrentDelayValue_offset spi@
;


variable adt-index
create atten-delay-table
512 cells allot
atten-delay-table 512 cells 0 fill

: ++ dup @ tuck 1+ swap ! ;

: adt!
  adt-index ++ 
  cells atten-delay-table + !
;

: adt-high-same-as-low
  256 0 do
    atten-delay-table i cells + @
    atten-delay-table i 256 + cells + !
  loop
;

: program-atten-delay-tables
  0 iCAT_atten_calibration_addr spi!
  512 0 do
    i cells atten-delay-table + @
    dup
    0xffffff and i set-atten-entry
    24 rshift i set-delay-entry
  loop
;

: set-gates-mask ( gates  mask -- )
  0 SetGates fifo!
  commit-fifo
;

: set-gates ( gates -- )
  0x1f set-gates-mask
;

: get-amp-delay
  iCAT_amp_delay_addr spi@
;

: set-amp-delay
  iCAT_amp_delay_addr spi!
;

: get-sine-delay
  iCAT_sine_delay_addr spi@
;

: set-sine-delay
  iCAT_sine_delay_addr spi!
;

: get-gate-delay
  iCAT_fifo_gate_delay_addr spi@
;

: set-gate-delay
  iCAT_fifo_gate_delay_addr spi!
;

: get-aux-delay
  iCAT_aux_delay_addr spi@
;

: set-aux-delay
  iCAT_aux_delay_addr spi!
;

: get-atten-delay
  iCAT_atten_delay_addr spi@
;

: set-atten-delay
  iCAT_atten_delay_addr spi!
;

: get-delay-delay
  iCAT_delay_delay_addr spi@
;

: set-delay-delay
  iCAT_delay_delay_addr spi!
;

: get-xmit-lo-gate-rise-delay
  iCAT_xmit_lo_rise_cut_through_addr spi@
;

: set-xmit-lo-gate-rise-delay
  iCAT_xmit_lo_rise_cut_through_addr spi!
;

: get-xmit-lo-gate-fall-delay
  iCAT_xmit_lo_fall_cut_through_addr spi@
;

: set-xmit-lo-gate-fall-delay
  iCAT_xmit_lo_fall_cut_through_addr spi!
;

: get-gates ( -- gates )
  iCAT_CurrentFifoGates_offset spi@
;

: force-gates ( mask value -- )
  swap 8 lshift or
  iCAT_ForceGates_offset spi!
;

: rcvlo-on 
  0 1 set-gates-mask
;

: rcvlo-off
  1 1 set-gates-mask
;

: xmtlo-on
  2 2 set-gates-mask
;

: xmtlo-off
  0 2 set-gates-mask
;

: xmtout-on
  4 4 set-gates-mask
;

: xmtout-off
  0 4 set-gates-mask
;

: if-on
  8 8 set-gates-mask
;

: if-off
  0 8 set-gates-mask
;

: gate-help
." xmtlo-on/xmtlo-off " cr
." xmtout-on/xmtout-off " cr
." rcvlo-on/rcvlo-off " cr
;
: set-phase ( phase - )
  0xffff and 0 0 0 SetPhase fifo!
  commit-fifo
;

: set-phase-deg
  65536e f* 360e f/ float>int set-phase
;

: get-phase ( -- phase )
  iCAT_CurrentPhase_offset spi@
;

: get-adjusted-phase
  iCAT_CompensatedPhase_offset spi@
;

: get-phase-deg
  get-phase int>float 360e f* 65536e f/
;

: set-amp ( amp - )
  0xffff and 0 0 0 SetAmp fifo!
  0xffff 0 0 0 SetAmpScale fifo!
  commit-fifo
;

: get-amp ( -- amp )
  iCAT_CurrentAmp_offset spi@
;

: get-adjusted-amp
  iCAT_CompensatedAmp_offset spi@
;

: set-aux
  0xff and
  ICAT_AUX_BUS_ADDR 1 SetAux fifo!
  commit-fifo
;

: get-aux
  iCAT_CurrentFifoAux_offset spi@
;

: set-aux-override
  iCAT_AuxOverrideValue_offset spi!
  1 iCAT_AuxOverride_offset spi!
;

: remove-aux-override
  0 iCAT_AuxOverride_offset spi!
;

: aux-out
  get-aux 4 invert and set-aux
;

: main-out
  get-aux 4 or set-aux
;

: aux-in-on
  get-aux 1 or set-aux
;

: aux-in-off
  get-aux 1 invert and set-aux
;

: aux-help
." main-out sets main output " cr
." aux-out sets aux output " cr
." aux-in-on turns on aux input " cr
." aux-in-off turns off aux input " cr
;

: disable-phase-counter
  iCAT_SynthesizerControl_offset spi@
  1 iCAT_enable_phase_counter_pos lshift invert and
  iCAT_SynthesizerControl_offset spi!
;

: enable-phase-counter
  iCAT_SynthesizerControl_offset spi@
  1 iCAT_enable_phase_counter_pos lshift or
  iCAT_SynthesizerControl_offset spi!
;

: disable-sync-start
  iCAT_reset_phase_accum_on_start_addr spi@
  1 iCAT_reset_phase_accum_on_start_pos lshift invert and
  iCAT_reset_phase_accum_on_start_addr spi!
;

: enable-sync-start
  iCAT_reset_phase_accum_on_start_addr spi@
  1 iCAT_reset_phase_accum_on_start_pos lshift or
  iCAT_reset_phase_accum_on_start_addr spi!
;

: disable-digital-scale-mode
  iCAT_digital_scale_mode_addr spi@
  1 iCAT_digital_scale_mode_pos lshift invert and
  iCAT_digital_scale_mode_addr spi!
;

: enable-digital-scale-mode
  iCAT_digital_scale_mode_addr spi@
  1 iCAT_digital_scale_mode_pos lshift or
  iCAT_digital_scale_mode_addr spi!
;

: disable-gate-sine-on-receive
  iCAT_gate_sine_on_receive_addr spi@
  1 iCAT_gate_sine_on_receive_pos lshift invert and
  iCAT_gate_sine_on_receive_addr spi!
;

: enable-gate-sine-on-receive
  iCAT_gate_sine_on_receive_addr spi@
  1 iCAT_gate_sine_on_receive_pos lshift or
  iCAT_gate_sine_on_receive_addr spi!
;

: disable-gate-sine-on-ifoff
  iCAT_gate_sine_on_ifoff_addr spi@
  1 iCAT_gate_sine_on_ifoff_pos lshift invert and
  iCAT_gate_sine_on_ifoff_addr spi!
;

: enable-gate-sine-on-ifoff
  iCAT_gate_sine_on_ifoff_addr spi@
  1 iCAT_gate_sine_on_ifoff_pos lshift or
  iCAT_gate_sine_on_ifoff_addr spi!
;

: frac fdup float>int int>float f- ;
: set-freq ( f:freq - )
  disable-phase-counter
  80e6 f/
  65536e f* fdup float>int iCAT_SynthesizerPhaseIncrementHigh_offset spi!
  frac 65536e f* float>int iCAT_SynthesizerPhaseIncrementLow_offset spi!
  enable-phase-counter
;


: reset-dac
  iCAT_dac_reset_addr spi@ dup
  1 iCAT_dac_reset_pos lshift or
  iCAT_dac_reset_addr spi!
  1 iCAT_dac_reset_pos lshift invert and
  iCAT_dac_reset_addr spi!
;

: ->dw ( f:gain -- dw ) 
  .12e f/ 72e f- 16e f* 3e f/ .5e f+ float>int ;

: dw-> ( dw -- f:gain )
  int>float 3e f* 16e f/ 72e f+ .12e f*
;

: ->nw ( f:gain -- dw ) 
  .12e f/ 1024e f* 3e f/ .5e f+ float>int ;

: nw-> ( dw -- f:gain )
  int>float 3e f* 1024e f/ .12e f*
;

: ->aw
  16383.5e f* float>int
;

: aw->
  extend16
  int>float 16383.5e f/
;

create dac-gain
4 cells allot
0 constant ampgain-offset
1 constant sinegain-offset
2 constant ampnullnom-offset
3 constant fgdnom-offset

: set-dacs
   dac-gain ampgain-offset cells + f@ ->nw iCAT_ampgainnom_addr spi!
   dac-gain sinegain-offset cells + f@ ->nw iCAT_sinegainnom_addr spi!
   dac-gain ampnullnom-offset cells + f@ ->aw iCAT_ampnullnom_addr spi!
   dac-gain fgdnom-offset cells + f@ ->aw iCAT_fgdnom_addr spi!
   0 iCAT_DACGainControl_offset spi!
   1 iCAT_DACGainControl_offset spi!
;

: sinegainnom iCAT_sinegainnom_addr spi@ nw-> ;
: ampgainnom iCAT_ampgainnom_addr spi@ nw-> ;
: ampnullnom iCAT_ampnullnom_addr spi@ aw-> ;
: fgdnom iCAT_fgdnom_addr spi@ aw-> ;

: sinegain iCAT_sinegain_addr spi@ nw-> ;
: ampgain iCAT_ampgain_addr spi@ nw-> ;
: ampnull iCAT_ampnull_addr spi@ aw-> ;
: fgd iCAT_fgd_addr spi@ aw-> ;

: set-dac-gain ( f:gain i:dac -- )
  1- cells dac-gain + f!
  set-dacs
;

: get-dac-gain ( dac -- f:gain )
  1- 4 * 0xb + dup 1+ swap
  dac@
  swap
  dac@ 8 lshift or
  dw->
;
  
: aux-dac! ( i:value i:dac -- )
  1- 4 * 0xd +
  2dup
  swap 0xff and swap dac!
  swap 8 rshift 0xff and swap 1+ dac!
;

: aux-dac@ ( i:dac -- i:value )
  1- 4 * 0xd +
  dup
  dac@	
  swap 1+ dac@
  8 lshift or
;

: set-aux-dac ( f:current i:dac -- )
  1+ cells dac-gain + f!
  set-dacs
;

: get-aux-dac ( i:dac -- f:current )
  aux-dac@ dup
  0x3ff and swap
  dup 0x8000 and
  if
    0x4000 and
    if
      0xfffffc00 or      
    then
    int>float
  else
    drop 0e
  then
  511.5e f/
; 

create dac-buf 128 allot
variable dac-buf-len
create dac-fname 40 allot
variable dac-fname-len

: remember-dac { f:val i:dac i:fname i:fnamelen -- }
  fname dac-fname fnamelen 1+ move
  fnamelen dac-fname-len !
  val dac s" %fe %d set-dac-gain " dac-buf 128 sprintf
  drop
  dac-buf-len !
  drop
  dac-buf dac-buf-len @ dac-fname dac-fname-len @ pfile!
;

: remember-aux-dac { f:val i:dac i:fname i:fnamelen -- }
  fname dac-fname fnamelen 1+ move
  fnamelen dac-fname-len !
  val dac s" %fe %d set-aux-dac " dac-buf 128 sprintf
  drop
  dac-buf-len !
  drop
  dac-buf dac-buf-len @ dac-fname dac-fname-len @ pfile!
;

: flash-ampgainnom
  dac-gain ampgain-offset cells + f@ 1 s" ampgainnom.4th" remember-dac
;

: flash-sinegainnom
  dac-gain sinegain-offset cells + f@ 2 s" sinegainnom.4th" remember-dac
;

: flash-ampnullnom
  dac-gain ampnullnom-offset cells + f@ 1 s" ampnullnom.4th" remember-aux-dac
;

: flash-fgdnom
  dac-gain fgdnom-offset cells + f@ 2 s" fgdnom.4th" remember-aux-dac
;

: set-amp-scale
  32768e f* float>int
  iCAT_amp_scale_addr spi!
;

: get-amp-scale
  iCAT_amp_scale_addr spi@
  int>float 32768e f/
;

: set-amp-bias
  iCAT_amp_bias_addr spi!
;

: get-amp-bias
  iCAT_amp_bias_addr spi@
;

: set-amp-invert
  iCAT_amp_invert_addr spi!
;

: get-amp-invert
  iCAT_amp_invert_addr spi@
;


: temp>float ( temp - f:temp )
  0x8000 - int>float 1 ICAT_TEMP_FRAC_WIDTH lshift int>float f/
;

: float>temp ( f:temp -- temp )
  1 ICAT_TEMP_INT_WIDTH 1- lshift int>float f+ 1 ICAT_TEMP_FRAC_WIDTH lshift int>float f* float>int
;

: get-temp ( - f:temp )
  iCAT_current_temperature_addr spi@ temp>float
;

: get-avg-temp ( - f:temp )
 iCAT_average_temperature_addr spi@ temp>float
;

: get-measured-temp ( - f:temp )
  iCAT_measured_temperature_addr spi@ temp>float
;

: acquire-temp
  1 iCAT_acquire_temperature_pos lshift invert
  iCAT_acquire_temperature_addr tuck spi@ and swap spi!
  1 iCAT_acquire_temperature_pos lshift 
  iCAT_acquire_temperature_addr tuck spi@ or swap spi!
;

: disable-forced-temp
  1 iCAT_force_temperature_pos lshift invert
  iCAT_force_temperature_addr tuck spi@ and swap spi!
;

: enable-forced-temp
  1 iCAT_force_temperature_pos lshift 
  iCAT_force_temperature_addr tuck spi@ or swap spi!
;

: enable-tcomp
  ICAT_AUX_TEMP_UPDATE_ENABLE ICAT_AUX_TEMP_UPDATE_ADDR 1 SetAux fifo!
  commit-fifo
;

: enable-cont-tcomp
  ICAT_AUX_TEMP_UPDATE_CONTINUOUS ICAT_AUX_TEMP_UPDATE_ADDR 1 SetAux fifo!
  commit-fifo
;

: disable-tcomp
  ICAT_AUX_TEMP_UPDATE_DISABLE ICAT_AUX_TEMP_UPDATE_ADDR 1 SetAux fifo!
  commit-fifo
  iCAT_program_dac_gain_addr dup 0 swap spi! 1 swap spi!
;

: take-temp ( -- f:temp )
  acquire-temp
  60 task-delay \ wait for the acquisition to complete
  get-temp
;

: print-temp take-temp f. ;

: force-temp ( f:temp -- )
  float>temp iCAT_forced_temperature_addr spi!
  enable-forced-temp
  set-dacs
;

: release-temp
  disable-forced-temp
  set-dacs
;

: enable-periodic-temp
  1 iCAT_periodic_temperature_acquisition_enable_pos lshift 
  iCAT_periodic_temperature_acquisition_enable_addr tuck spi@ or swap spi!
;

: disable-periodic-temp
  1 iCAT_periodic_temperature_acquisition_enable_pos lshift invert
  iCAT_periodic_temperature_acquisition_enable_addr tuck spi@ and swap spi!
;

: set-temp-period ( f:period - )
  10e f* float>int
  iCAT_temperature_acquisition_period_addr spi!
;

: get-temp-period ( - f:period )
  iCAT_temperature_acquisition_period_addr spi@
  int>float 10e f/
;

: tcomp-table-addr ( position -- addr ) ICAT_TEMP_COMP_TABLE_DEPTH 2 * * iCAT_TempCompTable_offset + ;

ICAT_TEMP_COMP_TABLE_PHASETC_POSITION    tcomp-table-addr constant PhaseTCTableLow
ICAT_TEMP_COMP_TABLE_AMPTC_POSITION      tcomp-table-addr constant AmpTCTableLow
ICAT_TEMP_COMP_TABLE_DELAYTC_POSITION    tcomp-table-addr constant DelayTCTableLow
ICAT_TEMP_COMP_TABLE_SINEGAINTC_POSITION tcomp-table-addr constant SineGainTCTableLow
ICAT_TEMP_COMP_TABLE_AMPGAINTC_POSITION  tcomp-table-addr constant AmpGainTCTableLow
ICAT_TEMP_COMP_TABLE_AMPNULLTC_POSITION  tcomp-table-addr constant AmpNullTCTableLow
ICAT_TEMP_COMP_TABLE_FGDTC_POSITION      tcomp-table-addr constant FGDTCTableLow

PhaseTCTableLow    ICAT_TEMP_COMP_TABLE_DEPTH + constant PhaseTCTableHigh
AmpTCTableLow      ICAT_TEMP_COMP_TABLE_DEPTH + constant AmpTCTableHigh
DelayTCTableLow    ICAT_TEMP_COMP_TABLE_DEPTH + constant DelayTCTableHigh
SineGainTCTableLow ICAT_TEMP_COMP_TABLE_DEPTH + constant SineGainTCTableHigh
AmpGainTCTableLow  ICAT_TEMP_COMP_TABLE_DEPTH + constant AmpGainTCTableHigh
AmpNullTCTableLow  ICAT_TEMP_COMP_TABLE_DEPTH + constant AmpNullTCTableHigh
FGDTCTableLow      ICAT_TEMP_COMP_TABLE_DEPTH + constant FGDTCTableHigh

: zero fdrop 0e ;
: one fdrop 1e ;

: program-multi-interp { table steps function scale -- }
  steps 0 do
    i 1+ int>float steps 256 / int>float f/ 128e f- \ convert step to temp
    function execute 				    \ evaluate interp function
    scale execute
    i table + spi!				    \ program entry
  loop
;

: phasetc-scaling float>int ;
: phasetc-scaling-inverse extend16 int>float ;
' phasetc-scaling constant phasetc-scaling-func

variable phasetc-func-low
variable phasetc-func-high

' zero phasetc-func-low !
' zero phasetc-func-high !

: program-phasetc-table
  PhaseTCTableLow  ICAT_TEMP_COMP_TABLE_DEPTH phasetc-func-low  @ phasetc-scaling-func program-multi-interp
  PhaseTCTableHigh ICAT_TEMP_COMP_TABLE_DEPTH phasetc-func-high @ phasetc-scaling-func program-multi-interp
;

: amptc-scaling .5e f- 65536e f* float>int ;
: amptc-scaling-inverse int>float 65536e f/ .5e f+ ;
' amptc-scaling constant amptc-scaling-func

variable amptc-func-low
variable amptc-func-high

' one amptc-func-low !
' one amptc-func-high !

: program-amptc-table
  AmpTCTableLow  ICAT_TEMP_COMP_TABLE_DEPTH amptc-func-low  @ amptc-scaling-func program-multi-interp
  AmpTCTableHigh ICAT_TEMP_COMP_TABLE_DEPTH amptc-func-high @ amptc-scaling-func program-multi-interp
;

: delaytc-scaling 256e f* float>int ;
: delaytc-scaling-inverse extend16 int>float 256e f/ ;
' delaytc-scaling constant delaytc-scaling-func

variable delaytc-func-low
variable delaytc-func-high

' zero delaytc-func-low !
' zero delaytc-func-high !

: program-delaytc-table
  DelayTCTableLow  ICAT_TEMP_COMP_TABLE_DEPTH delaytc-func-low  @ delaytc-scaling-func program-multi-interp
  DelayTCTableHigh ICAT_TEMP_COMP_TABLE_DEPTH delaytc-func-high @ delaytc-scaling-func program-multi-interp
;

: dac-gain-scale 32768e f* float>int ;
: dac-gain-scale-inverse int>float 32768e f/ ;
' dac-gain-scale constant dac-gain-scaling-func

variable t1
variable sinegaintc-func-low
variable sinegaintc-func-high

' one sinegaintc-func-low !
' one sinegaintc-func-high !

: program-sinegaintc-table
  SineGainTCTableLow  ICAT_TEMP_COMP_TABLE_DEPTH sinegaintc-func-low  @ dac-gain-scaling-func program-multi-interp
  SineGainTCTableHigh ICAT_TEMP_COMP_TABLE_DEPTH sinegaintc-func-high @ dac-gain-scaling-func program-multi-interp
;

variable ampgaintc-func-low
variable ampgaintc-func-high

' one ampgaintc-func-low !
' one ampgaintc-func-high !

: program-ampgaintc-table
  AmpGainTCTableLow  ICAT_TEMP_COMP_TABLE_DEPTH ampgaintc-func-low  @ dac-gain-scaling-func program-multi-interp
  AmpGainTCTableHigh ICAT_TEMP_COMP_TABLE_DEPTH ampgaintc-func-high @ dac-gain-scaling-func program-multi-interp
;

: aux-gain-scale 16384e f* float>int ;
: aux-gain-scale-inverse extend16 int>float 16384e f/ ;
' aux-gain-scale constant aux-gain-scaling-func

variable ampnulltc-func-low
variable ampnulltc-func-high

' zero ampnulltc-func-low !
' zero ampnulltc-func-high !

: program-ampnulltc-table
  AmpnullTCTableLow  ICAT_TEMP_COMP_TABLE_DEPTH ampnulltc-func-low  @ aux-gain-scaling-func program-multi-interp
  AmpnullTCTableHigh ICAT_TEMP_COMP_TABLE_DEPTH ampnulltc-func-high @ aux-gain-scaling-func program-multi-interp
;

variable fgdtc-func-low
variable fgdtc-func-high

' zero fgdtc-func-low !
' zero fgdtc-func-high !

: program-fgdtc-table
  FGDTCTableLow  ICAT_TEMP_COMP_TABLE_DEPTH fgdtc-func-low  @ aux-gain-scaling-func program-multi-interp
  FGDTCTableHigh ICAT_TEMP_COMP_TABLE_DEPTH fgdtc-func-high @ aux-gain-scaling-func program-multi-interp
;

: program-tcomp-tables
  program-amptc-table
  program-phasetc-table
  program-delaytc-table
  program-sinegaintc-table
  program-ampgaintc-table
  program-ampnulltc-table
  program-fgdtc-table
;


: amp-lin-get-points ( table index -- f:x0 f:y0 f:x1 f:y1 )
  dup f@
  1 cells + dup f@
  1 cells + dup f@
  1 cells + f@
;

: amp-lin-compute-point { f:x f:x0 f:y0 f:x1 f:y1 -- f:value }
  y1 y0 f-
  x1 x0 f-
  f/
  x x0 f- f*
  y0 f+
;

: find-amp-lin-break { table f:x -- index }
  table
  begin
    dup 2 cells + swap
    f@ x f>
  until
  4 cells -
;

: lin-table create 
  does> 
    fdup 
    find-amp-lin-break 
    amp-lin-get-points 
    amp-lin-compute-point 
;

lin-table amp-lin-table
    0e f,   0.00e f,
   41e f,   0.00e f,
   46e f,  20.52e f, 
   52e f,  31.47e f, 
   66e f,  51.12e f, 
   83e f,  71.53e f, 
  104e f,  95.09e f, 
  147e f, 140.83e f,
  207e f, 202.83e f,
  328e f, 325.35e f,
  512e f, 512.00e f,
65536e f,  65536e f,

variable amp-lin-func ' amp-lin-table amp-lin-func !

: program-amp-lin-table
  ICAT_AMP_LIN_TABLE_DEPTH 0 do
    i int>float amp-lin-func @ execute .5e f+ float>int 
    i iCAT_AmpLinearizationTable_offset + spi!
  loop
;


lin-table amp-gain-comp-table
0e f, 0e f,
64512e f, 64512e f,
65536e f, 65535e f,

variable amp-gain-comp-func ' amp-gain-comp-table amp-gain-comp-func !

: program-amp-gain-comp-table
  ICAT_AMP_GAIN_COMP_TABLE_DEPTH 0 do
    i 1+ 65536 ICAT_AMP_GAIN_COMP_TABLE_DEPTH / * int>float amp-gain-comp-func @ execute .5e f+ float>int
    i iCAT_AmpGainCompressionTable_offset + spi!
  loop
;

program-amp-gain-comp-table

variable fir-scale-factor
0e fir-scale-factor f!

: fir>int
  [ 1 17 lshift int>float ] fliteral f*
  float>int
;

: int>fir
  dup [ 1 17 lshift ] literal and if
    [ 1 14 lshift 1 - 18 lshift ] literal or
  then
  int>float 
  [ 1 17 lshift int>float ] fliteral f/
;

: program-fir-scale-factor
  fir-scale-factor f@ fir>int
  dup
  0xffff and iCAT_noise_scale_low_addr spi!
  16 rshift iCAT_noise_scale_high_addr spi!
;

: set-fir-scale
  fir-scale-factor f!
  program-fir-scale-factor
;

: get-fir-scale fir-scale-factor f@ ;

create fir-coeff-table
32 cells allot

: fir!
  fir>int swap
  2dup
  2 * iCAT_ShapedNoiseCoefficientTable_offset + spi!
  swap 16 rshift swap
  2 * 1+ iCAT_ShapedNoiseCoefficientTable_offset + spi!
;

: fir@
  dup
  2 * iCAT_ShapedNoiseCoefficientTable_offset + spi@
  swap
  2 * 1+ iCAT_ShapedNoiseCoefficientTable_offset + spi@
  16 lshift or
  int>fir
;

: program-fir-table
  32 0 do
    fir-coeff-table i cells + f@
    i fir!
  loop
;

: print-fir-table
  32 0 do
   i fir@
   i . f. cr
  loop
;

variable sine-scale-factor
1e sine-scale-factor f!

: sine-scale>int
  [ 1 20 lshift int>float ] fliteral f* float>int
;

: program-sine-scale-factor
  sine-scale-factor f@ sine-scale>int
  dup
  0xffff and iCAT_sine_scale_low_addr spi!
  16 rshift iCAT_sine_scale_high_addr spi!
;

: set-sine-scale
  sine-scale-factor f!
  program-sine-scale-factor
;

: get-sine-scale sine-scale-factor f@ ;

: update-temp 0 ICAT_AUX_TEMP_UPDATE_ADDR 1 SetAux fifo! commit-fifo ;

: phasetc iCAT_phasetc_addr spi@ ;

: amptc iCAT_amptc_addr spi@ ;

: delaytc iCAT_delaytc_addr spi@ ;

: sinegaintc iCAT_sinegaintc_addr spi@ ;

: ampgaintc iCAT_ampgaintc_addr spi@ ;

: ampnulltc iCAT_ampnulltc_addr spi@ ;

: fgdtc iCAT_fgdtc_addr spi@ ;

: reset-dcm dcm_rst_addr fpga + dup 1 swap ! 0 swap ! ;


: help
." Basics:" cr
." First, think HP Calculator." cr
." Use '.' (dot, no quotes) to pop the top of the stack and print it." cr
." Use 'x.' for hex." cr
." Use '.s' to show the contents of the stack." cr
." Type a number to push it onto the stack. Hex numbers should be" cr
." prefixed with '0x'." cr
." Floating point numbers must be in scientific notation." cr
." If you just leave a trailing 'e', then a 0 exponent is assumed." cr
." Thus 2e is 2.0. 20e6 is 20,000,000.0." cr
cr
." Setting values:" cr
." To set the delay, use the 'set-delay' command." cr
." Push the value for the delay onto the stack, and then type 'set-delay'" cr
." and press return." cr
." For example '0x7f set-delay' will set the delay value to all ones." cr
." To view the current delay value, use 'get-delay'." cr
." This pushes the current delay onto the stack. Use '.' or 'x.' to print it." cr
." For example, 'get-delay x.' will print 0x7f if the delay is 0x7f." cr
." Commands to set/get values are: " cr
." set-delay / get-delay" cr
." set-atten / get-atten" cr
." set-phase / get-phase" cr
." set-amp / get-amp" cr
." set-aux / get-aux" cr
cr
." DDS:" cr
." To set the DDS frequency, push a floating point frequency" cr
." on the stack in Hz and type 'set-freq'." cr
." For example '20e6 set-freq' sets the frequency to 20MHz." cr
cr
." DAC" cr
." To set DAC gain specify the gain in mA as a floating point number," cr
." and which DAC (1 or 2) and the command set-dac-gain." cr
." For example: 10e 1 set-dac-gain" cr
." will set DAC 1 to 10mA full gain." cr
." Use get-dac-gain to return the gain of a DAC." cr
." For example: 2 get-dac-gain f." cr
." will print the current gain in mA for DAC 2." cr
cr
." Miscellaneous:" cr
." 'soft-reset' resets the FPGA registers." cr
cr
gate-help
cr
aux-help
cr
." type flash-help for additional help with FLASH commands. " cr
;

: flash-help
." FLASH commands: " cr
."    isfdir              -- directory listing." cr
."    isfdel <filename>   -- delete a file." cr
."    pcp <file1> <file2> -- copy <file1> to <file2>." cr
."                        -- Prefix with icat: for iCAT and ffs:" cr
."                        -- for controller FLASH. " cr
cr
." FILES " cr
."    atten_delay.4th -- custom attenuation/delay tables." cr
."    amptc.4th       -- custom amp tempcomp tables." cr
."    phasetc.4th     -- custom phase tempcomp tables." cr
."    delaytc.4th     -- custom delay tempcomp tables." cr
."    sinegaintc.4th  -- custom sine DAC gain tempcomp tables." cr
."    ampgaintc.4th   -- custom amp DAC gain tempcomp tables." cr
."    ampnulltc.4th   -- custom amp nulling tempcomp tables." cr
."    fgdtc.4th       -- custom fine group delay tempcomp tables." cr
."    sinegainnom.4th -- custom setting for nominal sine DAC gain." cr
."    ampgainnom.4th  -- custom setting for nominal amp DAC gain." cr
."    ampnullnom.4th  -- custom setting for nominal amp nulling." cr
."    fgdnom.4th      -- custom setting for nominal fine group delay." cr
cr
." FLASH commands " cr
."    flash-sinegainnom -- copy current sine DAC gain to FLASH. " cr
."    flash-ampgainnom  -- copy current amp DAC gain to FLASH. " cr
."    flash-ampnullnom  -- copy current amp null DAC value to FLASH. " cr
."    flash-fgdnom      -- copy current fine group delat DAC value to FLASH. " cr
."    To program a custom table, use the pcp command to copy the" cr
."    appropriate file to FLASH. " cr
."    example: pcp rsh:fgdtc.4th icat:fgdtc.4th" cr
;

: print-value
  type
  dup
  .
  ."  ( " x. ." ) " cr
;

: fifo-status
  loop_buffer_busy_addr fpga + @ ." Loop unit " if ." busy " else ." idle " then cr
  InstructionFIFOCount_offset fpga + @ ." Instruction FIFO count: " . cr
  DataFIFOCount_offset fpga + @ ." Data FIFO count: " . cr
;

: hw-status
  ." FPGA ID: " print-dna cr
  print-build-date
  get-revision  s" FPGARev:  " print-value
  get-checksum  s" Checksum: " print-value
  get-board-rev s" BoardRev: " print-value
  get-temp ." Temperature: " f. ." °C " 
  get-avg-temp ." (" f. ." °C avg over last " 
  get-temp-period ICAT_TEMP_AVG_WINDOW int>float f* float>int . ." seconds)" cr
  ir-status ." Interface Robustness:  " if ." enabled " else ." disabled " then cr
;

: value-status
  get-amp   s" Amp:   " print-value
  get-phase s" Phase: " print-value
  get-atten s" Atten: " print-value
  get-delay s" Delay: " print-value
  get-adjusted-amp   s" AdjustedAmp:   " print-value
  get-adjusted-phase s" AdjustedPhase: " print-value
  get-atten-index    s" AttenIndex:    " print-value
  iCAT_ForceAttenuatorSelect_offset spi@
  if ." Atten value is forced. " cr then
;

: switch-status
  get-gates
  dup 8 and if ." if-on " else ." if-off " then  
  dup 4 and if ." xmtout-on " else ." xmtout-off " then  
  dup 2 and if ." xmtlo-on " else ." xmtlo-off " then  
  dup 1 and if ." rcvlo-off " else ." rcvlo-on " then 
  drop cr
  get-aux
  dup 4 and if ." main-out " else ." aux-out " then
  dup 1 and if ." aux-in-on " else ." aux-in-off " then
  drop cr
;

: tc-status
  ." PhaseTC:     " phasetc    dup phasetc-scaling-inverse f. ." (" x. ." )" cr
  ." AmpTC:       " amptc      dup amptc-scaling-inverse   f. ." (" x. ." )" cr
  ." DelayTC:     " delaytc    dup delaytc-scaling-inverse f. ." (" x. ." )" cr
  ." SineGainTC:  " sinegaintc dup dac-gain-scale-inverse  f. ." (" x. ." )" cr
  ." AmpGainTC:   " ampgaintc  dup dac-gain-scale-inverse  f. ." (" x. ." )" cr
  ." AmpNullTC:   " ampnulltc  dup aux-gain-scale-inverse  f. ." (" x. ." )" cr
  ." FGDTC:       " fgdtc      dup aux-gain-scale-inverse  f. ." (" x. ." )" cr
;

: dac-status
  ." AmpGain:     " 1 get-dac-gain f. ." (" ampgainnom  f. ." nominal)" cr
  ." SineGain:    " 2 get-dac-gain f. ." (" sinegainnom f. ." nominal)" cr
  ." AmpNullGain: " 1 get-aux-dac  f. ." (" ampnullnom  f. ." nominal)" cr
  ." FGDGain:     " 2 get-aux-dac  f. ." (" fgdnom      f. ." nominal)" cr
;

: status
  hw-status
  fifo-status
  value-status
  dac-status
  tc-status
  switch-status
;

: temp-comp-enabled?
  iCAT_temperature_compensation_enabled_addr spi@
  iCAT_temperature_compensation_enabled_pos rshift
  1 iCAT_temperature_compensation_enabled_width lshift 1- and
;

: continuous-update-mode?
  iCAT_continuous_update_mode_addr spi@
  iCAT_continuous_update_mode_pos rshift
  1 iCAT_continuous_update_mode_width lshift 1- and
;

: print-board-rev
  ." Rev:" get-board-rev .
;

: print-tcomp-mode
  ." Tcomp:"
  continuous-update-mode? if
    ." continuous "
  else temp-comp-enabled? if
    ." enabled "
  else
    ." disabled "
  then then
;  

: print-phasetc
  ." PhaseTC:" phasetc phasetc-scaling-inverse f.
;

: print-amptc
  ." AmpTC:" amptc amptc-scaling-inverse f.
;

: print-delaytc
  ." DelayTC:" delaytc delaytc-scaling-inverse f.
;

: print-sinegaintc
  ." SineGainTC:" sinegaintc dac-gain-scale-inverse  f.
;

: print-ampgaintc
  ." AmpGainTC:" ampgaintc dac-gain-scale-inverse f.
;

: print-ampnulltc
  ." AmpNullTC:" ampnulltc aux-gain-scale-inverse f.
;

: print-fgdtc
  ." FGDTC:" fgdtc aux-gain-scale-inverse f.
;

: print-measured-temp
  ." Temp: " get-measured-temp f.
;

: print-temp-comp
  print-board-rev
  print-tcomp-mode
  temp-comp-enabled? if
    print-temp
    get-board-rev 2 < if
      print-sinegaintc
      print-phasetc
      print-delaytc
    else
      print-sinegaintc
      print-phasetc
      print-fgdtc
    then
  then
  cr
;

variable temp-comp-monitor-enable
0 temp-comp-monitor-enable !

variable temp-comp-monitor-period

: set-temp-comp-monitor-period
  60 * temp-comp-monitor-period !
;

60 set-temp-comp-monitor-period

: temp-comp-monitor-task
  begin
    temp-comp-monitor-enable @
  while
    print-temp-comp
    temp-comp-monitor-period @ task-delay
  repeat
;

variable temp-comp-monitor-task-addr
' temp-comp-monitor-task temp-comp-monitor-task-addr !

: enable-temp-comp-monitor
 1 temp-comp-monitor-enable !
 temp-comp-monitor-task-addr @ 8192 0 200 s" tTempComp" task-spawn 
;

: disable-temp-comp-monitor
  0 temp-comp-monitor-enable !
;
.( Loading default atten/delay settings. ) cr
0 adt-index !
0xe39ebb adt!
0xdf9ebb adt!
0xdf8ebb adt!
0xdf8e7b adt!
0x4df8e7a adt!
0x4db8e7a adt!
0x4db7e7a adt!
0x5db7e3a adt!
0x6db7e39 adt!
0x7d77e39 adt!
0x8d76e39 adt!
0x9d76df9 adt!
0xad76df8 adt!
0xbd36df8 adt!
0xcd35df8 adt!
0xcd35db8 adt!
0xcd35db7 adt!
0xccf5db7 adt!
0xdcf4db7 adt!
0xdcf4d77 adt!
0xdcf4d76 adt!
0xecb4d76 adt!
0xecb3d76 adt!
0xecb3d36 adt!
0xfcb3d35 adt!
0xfc73d35 adt!
0xfc72d35 adt!
0xfc72cf5 adt!
0x10c72cf4 adt!
0x10c32cf4 adt!
0x10c31cf4 adt!
0x11c31cb4 adt!
0x11c31cb3 adt!
0x11bf1cb3 adt!
0x12bf0cb3 adt!
0x12bf0c73 adt!
0x13bf0c72 adt!
0x13bb0c72 adt!
0x14bafc72 adt!
0x15bafc32 adt!
0x15bafc31 adt!
0x16b6fc31 adt!
0x17b6ec31 adt!
0x17b6ebf1 adt!
0x18b6ebf0 adt!
0x18b2ebf0 adt!
0x18b2dbf0 adt!
0x18b2dbb0 adt!
0x18b2dbaf adt!
0x19aedbaf adt!
0x19aecbaf adt!
0x19aecb6f adt!
0x19aecb6e adt!
0x1aaacb6e adt!
0x1aaabb6e adt!
0x1aaabb2e adt!
0x1aaabb2d adt!
0x1aa6bb2d adt!
0x1aa6ab2d adt!
0x1aa6aaed adt!
0x1aa6aaec adt!
0x1aa2aaec adt!
0x1aa29aec adt!
0x1aa29aac adt!
0x1aa29aab adt!
0x1b9e9aab adt!
0x1b9e8aab adt!
0x1b9e8a6b adt!
0x1c9e8a6a adt!
0x1c9a8a6a adt!
0x1c9a7a6a adt!
0x1d9a7a2a adt!
0x1d9a7a29 adt!
0x1d967a29 adt!
0x1e966a29 adt!
0x1e9669e9 adt!
0x1e9669e8 adt!
0x1e9269e8 adt!
0x1e9259e8 adt!
0x1e9259a8 adt!
0x1f9259a7 adt!
0x1f8e59a7 adt!
0x1f8e49a7 adt!
0x1f8e4967 adt!
0x208e4966 adt!
0x208a4966 adt!
0x208a3966 adt!
0x208a3926 adt!
0x208a3925 adt!
0x20863925 adt!
0x20862925 adt!
0x208628e5 adt!
0x208628e4 adt!
0x208228e4 adt!
0x208218e4 adt!
0x208218a4 adt!
0x208218a3 adt!
0x217e18a3 adt!
0x217e08a3 adt!
0x227e0863 adt!
0x227e0862 adt!
0x237a0862 adt!
0x2379f862 adt!
0x2479f822 adt!
0x2479f821 adt!
0x2475f821 adt!
0x2575e821 adt!
0x2575e7e1 adt!
0x2675e7e0 adt!
0x2671e7e0 adt!
0x2771d7e0 adt!
0x2771d7a0 adt!
0x2771d79f adt!
0x286dd79f adt!
0x286dc79f adt!
0x286dc75f adt!
0x296dc75e adt!
0x2969c75e adt!
0x2969b75e adt!
0x2a69b71e adt!
0x2a69b71d adt!
0x2a65b71d adt!
0x2b65a71d adt!
0x2b65a6dd adt!
0x2c65a6dc adt!
0x2c61a6dc adt!
0x2d6196dc adt!
0x2d61969c adt!
0x2e61969b adt!
0x2e5d969b adt!
0x2e5d869b adt!
0x2f5d865b adt!
0x2f5d865a adt!
0x2f59865a adt!
0x3059765a adt!
0x3159761a adt!
0x32597619 adt!
0x33557619 adt!
0x34556619 adt!
0x355565d9 adt!
0x365565d8 adt!
0x375165d8 adt!
0x385155d8 adt!
0x39515598 adt!
0x3a515597 adt!
0x3a4d5597 adt!
0x3b4d4597 adt!
0x3b4d4557 adt!
0x3c4d4556 adt!
0x3c494556 adt!
0x3d493556 adt!
0x3d493516 adt!
0x3e493515 adt!
0x3e453515 adt!
0x3f452515 adt!
0x3f4524d5 adt!
0x404524d4 adt!
0x404124d4 adt!
0x414114d4 adt!
0x41411494 adt!
0x42411493 adt!
0x423d1493 adt!
0x433d0493 adt!
0x433d0453 adt!
0x443d0452 adt!
0x44390452 adt!
0x4538f452 adt!
0x4538f412 adt!
0x4638f411 adt!
0x4634f411 adt!
0x4734e411 adt!
0x4734e3d1 adt!
0x4834e3d0 adt!
0x4830e3d0 adt!
0x4930d3d0 adt!
0x4930d390 adt!
0x4a30d38f adt!
0x4a2cd38f adt!
0x4b2cc38f adt!
0x4b2cc34f adt!
0x4c2cc34e adt!
0x4c28c34e adt!
0x4d28b34e adt!
0x4d28b30e adt!
0x4e28b30d adt!
0x4e24b30d adt!
0x4f24a30d adt!
0x5024a2cd adt!
0x5124a2cc adt!
0x5220a2cc adt!
0x532092cc adt!
0x5420928c adt!
0x5520928b adt!
0x561c928b adt!
0x571c828b adt!
0x581c824b adt!
0x591c824a adt!
0x5a18824a adt!
0x5b18724a adt!
0x5c18720a adt!
0x5d187209 adt!
adt-high-same-as-low
1 constant icat_boot.4th
.( configuring iCAT board ) cr

fpga phase_bias_addr + constant rf-phase-bias
fpga amp_bias_addr + constant rf-amp-bias
: set-rf-phase-bias rf-phase-bias ! ;
: set-rf-amp-bias rf-amp-bias ! ;
: clear-bias-registers
  0 set-rf-phase-bias
  0 set-rf-amp-bias
;

variable icat-mode
fpga transmitter_mode_addr + constant transmitter_mode

: set-mr400
  transmitter_mode @ 1 and
  4 or transmitter_mode !
;

: set-vnmrs
  transmitter_mode @ 1 and
  transmitter_mode !
;

: set-icat
  transmitter_mode @ 1 or
  transmitter_mode !
  1 icat-mode !
;

: set-legacy
  transmitter_mode @ 1 invert and
  transmitter_mode !
  0 icat-mode !
;  

: set-icat-mode
  set-icat
  iCAT_ID_offset spi@
  10 = if 
    ." Detected iCAT attenuator/transmitter board. " 
    iCAT_Checksum_offset spi@
    ." Checksum: " . cr
  else
    ." No iCAT board detected. " cr
    set-legacy
  then
;

: boot-icat
  fpga ID_addr + @
  0xf and dup 1 =
  if
    drop
    fpga revision_addr + @
    4 rshift 0xf and dup 0 > 
    if
      ." iCAT capable RF controller revision: " . 
      fpga checksum_addr + @
      8 rshift
      ." checksum: " . cr
      print-build-date
      program-tcomp-tables
    else
      ." Non-iCAT capable RF controller revision: " . cr
    then
    check-checksum
  else
    dup
    0xb = if 
      drop
      print-build-date
      ." Spinner controller " cr
    else
      ." Non-RF controller type: " . cr
    then
  then
;

: configure-icat
  icat-mode @
  if
    reset-dac
    program-atten-delay-tables
    release-atten
    0e db
    4 set-aux
    0x2 set-gates
    0 set-amp
    0xffff set-amp
    set-dacs
    program-fir-table
    program-fir-scale-factor
    program-sine-scale-factor
    -20e6 set-freq
    clear-bias-registers
    take-temp fdrop
    enable-periodic-temp
  then
;
0 constant patgen.4th

fpga InterruptStatus_offset + constant i-status-reg
fpga InterruptEnable_offset + constant i-enable-reg
fpga InterruptClear_offset + constant i-clear-reg

: rf-phase-sum fpga PhaseChecksum_offset + @ ;
: rf-amp-sum fpga AmpChecksum_offset + @ ;
: rf-gate-sum fpga FifoGateChecksum_offset + @ ;
: rf-txd-sum fpga TXDChecksum_offset + @ ;

: icat-phase-sum iCAT_PhaseChecksum_offset spi@ ;
: icat-amp-sum iCAT_AmpChecksum_offset spi@ ;
: icat-gate-sum iCAT_FifoGateChecksum_offset spi@ ;
: icat-txd-sum iCAT_TXDCheckSumLow_offset spi@ iCAT_TXDCheckSumHigh_offset spi@ 16 lshift or ;

: i-fifo-cnt InstructionFIFOCount_offset fpga + @ ;
: d-fifo-cnt DataFIFOCount_offset fpga + @ ;
: duration CumulativeDurationLow_offset fpga + @ ;

: duration-64
  duration
  CumulativeDurationHigh_offset fpga + @
  <# #s #>
;

: clear-duration
  fpga ClearCumulativeDuration_offset + dup 1 swap ! 0 swap !
;

: clear-sums
  fpga ClearChecksums_offset + dup 1 swap ! 0 swap !
  iCAT_ClearChecksums_offset dup 1 swap spi! 0 swap spi!
;

: h-Duration Duration_Offset fpga + @ ;
: h-Gates Gates_Offset fpga + @ ;
: h-Phase Phase_Offset fpga + @ ;
: h-PhaseIncrement PhaseIncrement_Offset fpga + @ ;
: h-PhaseCount PhaseCount_Offset fpga + @ ;
: h-PhaseClear PhaseClear_Offset fpga + @ ;
: h-PhaseC PhaseC_Offset fpga + @ ;
: h-PhaseCIncrement PhaseCIncrement_Offset fpga + @ ;
: h-PhaseCCount PhaseCCount_Offset fpga + @ ;
: h-PhaseCClear PhaseCClear_Offset fpga + @ ;
: h-Amp Amp_Offset fpga + @ ;
: h-AmpIncrement AmpIncrement_Offset fpga + @ ;
: h-AmpCount AmpCount_Offset fpga + @ ;
: h-AmpClear AmpClear_Offset fpga + @ ;
: h-AmpScale AmpScale_Offset fpga + @ ;
: h-AmpScaleIncrement AmpScaleIncrement_Offset fpga + @ ;
: h-AmpScaleCount AmpScaleCount_Offset fpga + @ ;
: h-AmpScaleClear AmpScaleClear_Offset fpga + @ ;
: h-User User_Offset fpga + @ ;

: f-phase FIFOPhase_offset fpga + @ ;
: f-amp FIFOAmp_offset fpga + @ ;
: f-gates FIFOGates_offset fpga + @ ;
: f-user FIFOUser_offset fpga + @ ;
: f-aux FIFOAUX_offset fpga + @ ;

: disable-invalid-instr-int
 i-enable-reg @ 1 invalid_opcode_int_status_pos lshift invert and i-enable-reg !
;

: print-sums
  ." rf-phase-sum " rf-phase-sum x. cr
  ." icat-phase-sum " icat-phase-sum x. cr
  ." rf-amp-sum " rf-amp-sum x. cr
  ." icat-amp-sum " icat-amp-sum x. cr
  ." rf-gate-sum " rf-gate-sum x. cr
  ." icat-gate-sum " icat-gate-sum x. cr
  ." rf-txd-sum " rf-txd-sum x. cr
  ." icat-txd-sum " icat-txd-sum x. cr
;

: compare-sums
  rf-phase-sum icat-phase-sum =
  rf-amp-sum icat-amp-sum = and
  rf-gate-sum icat-gate-sum = and
  rf-txd-sum icat-txd-sum = and
;

: poll-wait
  begin
  2dup
  @ <>
  while repeat
  2drop	
;  

: check-test-results
  compare-sums
  if 
    ." Test passed"
    cr
  else
    ." Test FAILED"
    cr
    print-sums
  then
;

: rand-phase-amp
  0 do
    random 0xffff and 0 0 0 SetPhase loop!
    random 0xffff and 0 0 1 SetAmp loop!
  loop
;

: gen-rand-pattern-test ( burst-length clocks-per-cycle -- )
  clear-loop
  0 SetDuration loop!
  0xffff 0 0 0 SetAmpScale loop!
  dup rand-phase-amp
  0 0 0 0 SetPhase loop!
  0 0 0 0 SetAmp loop!
  1 SetDuration loop!
;

: rand-amp
  0 do
    random 0xffff and 0 0 1 SetAmp loop!
  loop
;

: gen-rand-amp-test ( burst-length -- )
  clear-loop
  1 0 SetDuration loop!
  0xffff 0 0 0 SetAmpScale loop!
  dup rand-amp
  0 0 0 0 SetAmp loop!
  1 SetDuration loop!
;

: gen-amp-test ( value burst-length )
  clear-loop
  1 0 SetDuration loop!
  0xffff 0 0 0 SetAmpScale loop!
  tuck 0 do
    dup 0 0 1 SetAmp loop!
    0 0 0 1 SetAmp loop!
  loop
  drop
  2 * 1 SetDuration loop!
;

: start-loop
  clear-sums
  clear-duration
  set-num-loops
  1 0 SetDuration fifo!
  0 loop_start_addr fpga!
  1 loop_start_addr fpga!
  1 task-delay
  start-fifo
;

: wait-loop
  wait-fifo
  1 task-delay
  duration-64 type ."  cycles completed. " cr
  check-test-results
;

: run-loop ( num-loops -- )
  start-loop
  wait-loop
;

: blink reset-fifo clear-loop 1 seq-aux 0xf 0xe seq-gates seq-ms 4 seq-aux 0xf 0 seq-gates seq-ms ;

: self-test
  0 . 
;

create sinegain-table
-0.014156e f,
-0.007962e f,
-0.001767e f,
0.004428e f,
0.010622e f,
0.016817e f,
0.023012e f,
0.029206e f,
0.035401e f,
0.041596e f,
0.047790e f,
0.053985e f,
0.060180e f,
0.066374e f,
0.072569e f,
0.078764e f,
0.084958e f,
0.091153e f,
0.097348e f,
0.103542e f,
0.109737e f,
0.115932e f,
0.122126e f,
0.128321e f,
0.134516e f,
0.140710e f,
0.146905e f,
0.153100e f,
0.159294e f,
0.165489e f,
0.171684e f,
0.177878e f,
0.184073e f,
0.190268e f,
0.196462e f,
0.202657e f,
0.208852e f,
0.215046e f,
0.221241e f,
0.227436e f,
0.233630e f,
0.239825e f,
0.246020e f,
0.252214e f,
0.258409e f,
0.264604e f,
0.270798e f,
0.276993e f,
0.283188e f,
0.289382e f,
0.295577e f,
0.301772e f,
0.307966e f,
0.314161e f,
0.320356e f,
0.326551e f,
0.332745e f,
0.338940e f,
0.345135e f,
0.351329e f,
0.357524e f,
0.363719e f,
0.369913e f,
0.376108e f,
0.382303e f,
0.388497e f,
0.394692e f,
0.400887e f,
0.407081e f,
0.413276e f,
0.419471e f,
0.425665e f,
0.431860e f,
0.438055e f,
0.444249e f,
0.450444e f,
0.456639e f,
0.462833e f,
0.469028e f,
0.475223e f,
0.481417e f,
0.487612e f,
0.493807e f,
0.500001e f,
0.506196e f,
0.512391e f,
0.518585e f,
0.524780e f,
0.530975e f,
0.537169e f,
0.543364e f,
0.549559e f,
0.555753e f,
0.561948e f,
0.568143e f,
0.574337e f,
0.580532e f,
0.586727e f,
0.592921e f,
0.599116e f,
0.605311e f,
0.611505e f,
0.617700e f,
0.623895e f,
0.630089e f,
0.636284e f,
0.642479e f,
0.648673e f,
0.654868e f,
0.661063e f,
0.667257e f,
0.673452e f,
0.679647e f,
0.685841e f,
0.692036e f,
0.698231e f,
0.704425e f,
0.710620e f,
0.716815e f,
0.723009e f,
0.729204e f,
0.735399e f,
0.741593e f,
0.747788e f,
0.753983e f,
0.760177e f,
0.766372e f,
0.772567e f,
0.778761e f,
0.784956e f,
0.791151e f,
0.797345e f,
0.803540e f,
0.809735e f,
0.815929e f,
0.822124e f,
0.828319e f,
0.834513e f,
0.840708e f,
0.846903e f,
0.853098e f,
0.859292e f,
0.865487e f,
0.871682e f,
0.878319e f,
0.884956e f,
0.889381e f,
0.896018e f,
0.902655e f,
0.907080e f,
0.915929e f,
0.920354e f,
0.924779e f,
0.931416e f,
0.938053e f,
0.944690e f,
0.949115e f,
0.955752e f,
0.962389e f,
0.969027e f,
0.975664e f,
0.980089e f,
0.988938e f,
0.993363e f,
1.000000e f,
1.004425e f,
1.011062e f,
1.017699e f,
1.026549e f,
1.030974e f,
1.037611e f,
1.044248e f,
1.050885e f,
1.057522e f,
1.064159e f,
1.070796e f,
1.079646e f,
1.088496e f,
1.095133e f,
1.101770e f,
1.110619e f,
1.117257e f,
1.126106e f,
1.137168e f,
1.145575e f,
1.153982e f,
1.162389e f,
1.170797e f,
1.179204e f,
1.187611e f,
1.196018e f,
1.204425e f,
1.212832e f,
1.221239e f,
1.229646e f,
1.238053e f,
1.246460e f,
1.254867e f,
1.263274e f,
1.271682e f,
1.280089e f,
1.288496e f,
1.296903e f,
1.305310e f,
1.313717e f,
1.322124e f,
1.330531e f,
1.338938e f,
1.347345e f,
1.355752e f,
1.364159e f,
1.372566e f,
1.380974e f,
1.389381e f,
1.397788e f,
1.406195e f,
1.414602e f,
1.423009e f,
1.431416e f,
1.439823e f,
1.448230e f,
1.456637e f,
1.465044e f,
1.473451e f,
1.481859e f,
1.490266e f,
1.498673e f,
1.507080e f,
1.515487e f,
1.523894e f,
1.532301e f,
1.540708e f,
1.549115e f,
1.557522e f,
1.565929e f,
1.574336e f,
1.582743e f,
1.591151e f,
1.599558e f,
1.607965e f,
1.616372e f,
1.624779e f,
1.633186e f,
1.641593e f,
1.650000e f,
1.658407e f,
1.666814e f,
1.675221e f,
1.683628e f,
1.692035e f,
1.700443e f,
1.708850e f,
1.717257e f,
1.725664e f,
1.734071e f,
1.742478e f,

: sinegain-interp { f:temp -- }
  temp 128e f+ float>int cells sinegain-table + f@ fdup
  temp 129e f+ float>int cells sinegain-table + f@
  fswap f-
  temp fdup float>int int>float f- f* f+
;
: ampgain-interp one ;
: ampnull-interp zero ;
 
create fgd-table
0.809763e f,
0.805071e f,
0.800379e f,
0.795687e f,
0.790995e f,
0.786303e f,
0.781611e f,
0.776919e f,
0.772227e f,
0.767535e f,
0.762843e f,
0.758151e f,
0.753459e f,
0.748767e f,
0.744075e f,
0.739383e f,
0.734691e f,
0.729999e f,
0.725307e f,
0.720615e f,
0.715923e f,
0.711231e f,
0.706539e f,
0.701847e f,
0.697155e f,
0.692463e f,
0.687771e f,
0.683079e f,
0.678387e f,
0.673695e f,
0.669003e f,
0.664311e f,
0.659619e f,
0.654927e f,
0.650235e f,
0.645543e f,
0.640851e f,
0.636159e f,
0.631467e f,
0.626775e f,
0.622083e f,
0.617391e f,
0.612699e f,
0.608007e f,
0.603315e f,
0.598623e f,
0.593931e f,
0.589239e f,
0.584547e f,
0.579855e f,
0.575163e f,
0.570471e f,
0.565779e f,
0.561087e f,
0.556395e f,
0.551703e f,
0.547011e f,
0.542319e f,
0.537627e f,
0.532935e f,
0.528243e f,
0.523551e f,
0.518859e f,
0.514167e f,
0.509475e f,
0.504783e f,
0.500091e f,
0.495399e f,
0.490707e f,
0.486015e f,
0.481323e f,
0.476631e f,
0.471939e f,
0.467247e f,
0.462555e f,
0.457863e f,
0.453171e f,
0.448479e f,
0.443787e f,
0.439095e f,
0.434403e f,
0.429711e f,
0.425019e f,
0.420327e f,
0.415635e f,
0.410943e f,
0.406251e f,
0.401559e f,
0.396867e f,
0.392175e f,
0.387483e f,
0.382791e f,
0.378099e f,
0.373407e f,
0.368715e f,
0.364023e f,
0.359331e f,
0.354639e f,
0.349947e f,
0.345255e f,
0.340563e f,
0.335871e f,
0.331179e f,
0.326487e f,
0.321795e f,
0.317103e f,
0.312411e f,
0.307719e f,
0.303027e f,
0.298335e f,
0.293643e f,
0.288951e f,
0.284259e f,
0.279567e f,
0.274875e f,
0.270183e f,
0.265491e f,
0.260799e f,
0.256107e f,
0.251415e f,
0.246723e f,
0.242031e f,
0.237339e f,
0.232647e f,
0.227955e f,
0.223263e f,
0.218571e f,
0.213879e f,
0.209187e f,
0.204495e f,
0.199803e f,
0.195111e f,
0.190419e f,
0.185727e f,
0.181035e f,
0.176343e f,
0.171651e f,
0.166959e f,
0.162267e f,
0.157575e f,
0.152883e f,
0.148191e f,
0.143499e f,
0.138807e f,
0.134897e f,
0.129032e f,
0.125122e f,
0.119257e f,
0.115347e f,
0.109482e f,
0.101661e f,
0.095796e f,
0.089931e f,
0.084066e f,
0.076246e f,
0.070381e f,
0.062561e f,
0.056696e f,
0.052785e f,
0.043010e f,
0.035190e f,
0.029325e f,
0.019550e f,
0.013685e f,
0.003910e f,
-0.001955e f,
-0.009776e f,
-0.019551e f,
-0.029326e f,
-0.035191e f,
-0.044966e f,
-0.052786e f,
-0.064517e f,
-0.072337e f,
-0.082112e f,
-0.093842e f,
-0.101662e f,
-0.115347e f,
-0.127078e f,
-0.138808e f,
-0.152493e f,
-0.166178e f,
-0.179864e f,
-0.201369e f,
-0.216227e f,
-0.231085e f,
-0.245944e f,
-0.260802e f,
-0.275660e f,
-0.290518e f,
-0.305376e f,
-0.320235e f,
-0.335093e f,
-0.349951e f,
-0.364809e f,
-0.379667e f,
-0.394526e f,
-0.409384e f,
-0.424242e f,
-0.439100e f,
-0.453958e f,
-0.468817e f,
-0.483675e f,
-0.498533e f,
-0.513391e f,
-0.528249e f,
-0.543108e f,
-0.557966e f,
-0.572824e f,
-0.587682e f,
-0.602540e f,
-0.617399e f,
-0.632257e f,
-0.647115e f,
-0.661973e f,
-0.676831e f,
-0.691690e f,
-0.706548e f,
-0.721406e f,
-0.736264e f,
-0.751122e f,
-0.765981e f,
-0.780839e f,
-0.795697e f,
-0.810555e f,
-0.825413e f,
-0.840272e f,
-0.855130e f,
-0.869988e f,
-0.884846e f,
-0.899704e f,
-0.914563e f,
-0.929421e f,
-0.944279e f,
-0.959137e f,
-0.973995e f,
-0.988854e f,
-1.003712e f,
-1.018570e f,
-1.033428e f,
-1.048286e f,
-1.063145e f,
-1.078003e f,
-1.092861e f,
-1.107719e f,
-1.122577e f,
-1.137436e f,
-1.152294e f,
-1.167152e f,
-1.182010e f,
-1.196868e f,
-1.211727e f,
-1.226585e f,
-1.241443e f,
-1.256301e f,
-1.271159e f,

: fgd-interp { f:temp -- }
  temp 128e f+ float>int cells fgd-table + f@ fdup
  temp 129e f+ float>int cells fgd-table + f@
  fswap f-
  temp fdup float>int int>float f- f* f+
;
create phase-table
2614.000000e f,
2598.000000e f,
2582.000000e f,
2566.000000e f,
2550.000000e f,
2534.000000e f,
2518.000000e f,
2502.000000e f,
2486.000000e f,
2470.000000e f,
2454.000000e f,
2438.000000e f,
2422.000000e f,
2406.000000e f,
2390.000000e f,
2374.000000e f,
2358.000000e f,
2342.000000e f,
2326.000000e f,
2310.000000e f,
2294.000000e f,
2278.000000e f,
2262.000000e f,
2246.000000e f,
2230.000000e f,
2214.000000e f,
2198.000000e f,
2182.000000e f,
2166.000000e f,
2150.000000e f,
2134.000000e f,
2118.000000e f,
2102.000000e f,
2086.000000e f,
2070.000000e f,
2054.000000e f,
2038.000000e f,
2022.000000e f,
2006.000000e f,
1990.000000e f,
1974.000000e f,
1958.000000e f,
1942.000000e f,
1926.000000e f,
1910.000000e f,
1894.000000e f,
1878.000000e f,
1862.000000e f,
1846.000000e f,
1830.000000e f,
1814.000000e f,
1798.000000e f,
1782.000000e f,
1766.000000e f,
1750.000000e f,
1734.000000e f,
1718.000000e f,
1702.000000e f,
1686.000000e f,
1670.000000e f,
1654.000000e f,
1638.000000e f,
1622.000000e f,
1606.000000e f,
1590.000000e f,
1574.000000e f,
1558.000000e f,
1542.000000e f,
1526.000000e f,
1510.000000e f,
1494.000000e f,
1478.000000e f,
1462.000000e f,
1446.000000e f,
1430.000000e f,
1414.000000e f,
1398.000000e f,
1382.000000e f,
1366.000000e f,
1350.000000e f,
1334.000000e f,
1318.000000e f,
1302.000000e f,
1286.000000e f,
1270.000000e f,
1254.000000e f,
1238.000000e f,
1222.000000e f,
1206.000000e f,
1190.000000e f,
1174.000000e f,
1158.000000e f,
1142.000000e f,
1126.000000e f,
1110.000000e f,
1094.000000e f,
1078.000000e f,
1062.000000e f,
1046.000000e f,
1030.000000e f,
1014.000000e f,
998.000000e f,
982.000000e f,
966.000000e f,
950.000000e f,
934.000000e f,
918.000000e f,
902.000000e f,
886.000000e f,
870.000000e f,
854.000000e f,
838.000000e f,
822.000000e f,
806.000000e f,
790.000000e f,
774.000000e f,
758.000000e f,
742.000000e f,
726.000000e f,
710.000000e f,
694.000000e f,
678.000000e f,
662.000000e f,
646.000000e f,
630.000000e f,
614.000000e f,
598.000000e f,
582.000000e f,
566.000000e f,
550.000000e f,
534.000000e f,
518.000000e f,
502.000000e f,
486.000000e f,
470.000000e f,
454.000000e f,
438.000000e f,
422.000000e f,
406.000000e f,
390.000000e f,
374.000000e f,
358.000000e f,
342.000000e f,
326.000000e f,
313.000000e f,
292.000000e f,
277.000000e f,
261.000000e f,
248.000000e f,
229.000000e f,
214.000000e f,
197.000000e f,
184.000000e f,
170.000000e f,
154.000000e f,
139.000000e f,
123.000000e f,
79.000000e f,
62.000000e f,
43.000000e f,
29.000000e f,
15.000000e f,
-6.000000e f,
-14.000000e f,
-1.000000e f,
-4.000000e f,
-18.000000e f,
-31.000000e f,
-50.000000e f,
-59.000000e f,
-73.000000e f,
-90.000000e f,
-109.000000e f,
-117.000000e f,
-130.000000e f,
-146.000000e f,
-181.000000e f,
-196.000000e f,
-206.000000e f,
-223.000000e f,
-239.000000e f,
-251.000000e f,
-269.000000e f,
-298.000000e f,
-316.000000e f,
-334.000000e f,
-352.000000e f,
-370.000000e f,
-388.000000e f,
-406.000000e f,
-424.000000e f,
-442.000000e f,
-460.000000e f,
-478.000000e f,
-496.000000e f,
-514.000000e f,
-532.000000e f,
-550.000000e f,
-568.000000e f,
-586.000000e f,
-604.000000e f,
-622.000000e f,
-640.000000e f,
-658.000000e f,
-676.000000e f,
-694.000000e f,
-712.000000e f,
-730.000000e f,
-748.000000e f,
-766.000000e f,
-784.000000e f,
-802.000000e f,
-820.000000e f,
-838.000000e f,
-856.000000e f,
-874.000000e f,
-892.000000e f,
-910.000000e f,
-928.000000e f,
-946.000000e f,
-964.000000e f,
-982.000000e f,
-1000.000000e f,
-1018.000000e f,
-1036.000000e f,
-1054.000000e f,
-1072.000000e f,
-1090.000000e f,
-1108.000000e f,
-1126.000000e f,
-1144.000000e f,
-1162.000000e f,
-1180.000000e f,
-1198.000000e f,
-1216.000000e f,
-1234.000000e f,
-1252.000000e f,
-1270.000000e f,
-1288.000000e f,
-1306.000000e f,
-1324.000000e f,
-1342.000000e f,
-1360.000000e f,
-1378.000000e f,
-1396.000000e f,
-1414.000000e f,
-1432.000000e f,
-1450.000000e f,
-1468.000000e f,
-1486.000000e f,
-1504.000000e f,
-1522.000000e f,
-1540.000000e f,
-1558.000000e f,
-1576.000000e f,
-1594.000000e f,

: phase-interp { f:temp -- }
  temp 128e f+ float>int cells phase-table + f@ fdup
  temp 129e f+ float>int cells phase-table + f@
  fswap f-
  temp fdup float>int int>float f- f* f+
;

: amp-interp one ;
: delay-interp zero ;

: set-sinegainnom
  10e 2 set-dac-gain
;
: set-ampgainnom
  10e 1 set-dac-gain
;
: set-ampnullnom
  0e 1 set-aux-dac
;
: set-fgdnom
  1.346965e 2 set-aux-dac
;

create sinegain-rev01-table
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.600000e f,
0.610000e f,
0.610000e f,
0.620000e f,
0.620000e f,
0.620000e f,
0.630000e f,
0.630000e f,
0.630000e f,
0.640000e f,
0.640000e f,
0.650000e f,
0.650000e f,
0.650000e f,
0.660000e f,
0.660000e f,
0.660000e f,
0.670000e f,
0.670000e f,
0.680000e f,
0.680000e f,
0.680000e f,
0.690000e f,
0.690000e f,
0.700000e f,
0.700000e f,
0.710000e f,
0.710000e f,
0.710000e f,
0.720000e f,
0.720000e f,
0.730000e f,
0.730000e f,
0.740000e f,
0.740000e f,
0.740000e f,
0.750000e f,
0.750000e f,
0.760000e f,
0.760000e f,
0.770000e f,
0.770000e f,
0.780000e f,
0.780000e f,
0.780000e f,
0.790000e f,
0.790000e f,
0.800000e f,
0.800000e f,
0.810000e f,
0.810000e f,
0.820000e f,
0.820000e f,
0.830000e f,
0.830000e f,
0.840000e f,
0.840000e f,
0.850000e f,
0.850000e f,
0.860000e f,
0.860000e f,
0.870000e f,
0.870000e f,
0.880000e f,
0.880000e f,
0.890000e f,
0.890000e f,
0.900000e f,
0.900000e f,
0.910000e f,
0.920000e f,
0.920000e f,
0.930000e f,
0.930000e f,
0.940000e f,
0.940000e f,
0.950000e f,
0.950000e f,
0.960000e f,
0.970000e f,
0.970000e f,
0.980000e f,
0.980000e f,
0.990000e f,
0.990000e f,
1.000000e f,
1.010000e f,
1.010000e f,
1.020000e f,
1.020000e f,
1.030000e f,
1.040000e f,
1.040000e f,
1.050000e f,
1.050000e f,
1.060000e f,
1.070000e f,
1.070000e f,
1.080000e f,
1.090000e f,
1.090000e f,
1.100000e f,
1.110000e f,
1.110000e f,
1.120000e f,
1.130000e f,
1.130000e f,
1.140000e f,
1.150000e f,
1.150000e f,
1.160000e f,
1.170000e f,
1.170000e f,
1.180000e f,
1.190000e f,
1.190000e f,
1.200000e f,
1.210000e f,
1.220000e f,
1.220000e f,
1.230000e f,
1.240000e f,
1.240000e f,
1.250000e f,
1.260000e f,
1.270000e f,
1.270000e f,
1.280000e f,
1.290000e f,
1.300000e f,
1.310000e f,
1.310000e f,
1.320000e f,
1.330000e f,
1.340000e f,
1.340000e f,
1.350000e f,
1.360000e f,
1.370000e f,
1.380000e f,
1.380000e f,
1.390000e f,
1.400000e f,
1.410000e f,
1.420000e f,
1.430000e f,
1.430000e f,
1.440000e f,
1.450000e f,
1.460000e f,
1.470000e f,
1.480000e f,
1.490000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,
1.500000e f,

: sinegain-rev01-interp { f:temp -- }
  temp 128e f+ float>int cells sinegain-rev01-table + f@ fdup
  temp 129e f+ float>int cells sinegain-rev01-table + f@
  fswap f-
  temp fdup float>int int>float f- f* f+
;

: ampgain-rev01-interp one ;
: ampnull-rev01-interp zero ;
: fgd-rev01-interp zero ;
create phase-rev01-table
2445.000000e f,
2430.000000e f,
2415.000000e f,
2400.000000e f,
2385.000000e f,
2370.000000e f,
2355.000000e f,
2340.000000e f,
2325.000000e f,
2310.000000e f,
2295.000000e f,
2280.000000e f,
2265.000000e f,
2250.000000e f,
2235.000000e f,
2220.000000e f,
2205.000000e f,
2190.000000e f,
2175.000000e f,
2160.000000e f,
2145.000000e f,
2130.000000e f,
2115.000000e f,
2100.000000e f,
2085.000000e f,
2070.000000e f,
2055.000000e f,
2040.000000e f,
2025.000000e f,
2010.000000e f,
1995.000000e f,
1980.000000e f,
1965.000000e f,
1950.000000e f,
1935.000000e f,
1920.000000e f,
1905.000000e f,
1890.000000e f,
1875.000000e f,
1860.000000e f,
1845.000000e f,
1830.000000e f,
1815.000000e f,
1800.000000e f,
1785.000000e f,
1770.000000e f,
1755.000000e f,
1740.000000e f,
1725.000000e f,
1710.000000e f,
1695.000000e f,
1680.000000e f,
1665.000000e f,
1650.000000e f,
1635.000000e f,
1620.000000e f,
1605.000000e f,
1590.000000e f,
1575.000000e f,
1560.000000e f,
1545.000000e f,
1530.000000e f,
1515.000000e f,
1500.000000e f,
1485.000000e f,
1470.000000e f,
1455.000000e f,
1440.000000e f,
1425.000000e f,
1410.000000e f,
1395.000000e f,
1380.000000e f,
1365.000000e f,
1350.000000e f,
1335.000000e f,
1320.000000e f,
1305.000000e f,
1290.000000e f,
1275.000000e f,
1260.000000e f,
1245.000000e f,
1230.000000e f,
1215.000000e f,
1200.000000e f,
1185.000000e f,
1170.000000e f,
1155.000000e f,
1140.000000e f,
1125.000000e f,
1110.000000e f,
1095.000000e f,
1080.000000e f,
1065.000000e f,
1050.000000e f,
1035.000000e f,
1020.000000e f,
1005.000000e f,
990.000000e f,
975.000000e f,
960.000000e f,
945.000000e f,
930.000000e f,
915.000000e f,
900.000000e f,
885.000000e f,
870.000000e f,
855.000000e f,
840.000000e f,
825.000000e f,
810.000000e f,
795.000000e f,
780.000000e f,
765.000000e f,
750.000000e f,
735.000000e f,
720.000000e f,
705.000000e f,
690.000000e f,
675.000000e f,
660.000000e f,
645.000000e f,
630.000000e f,
615.000000e f,
600.000000e f,
585.000000e f,
570.000000e f,
555.000000e f,
540.000000e f,
525.000000e f,
510.000000e f,
495.000000e f,
480.000000e f,
465.000000e f,
450.000000e f,
435.000000e f,
420.000000e f,
405.000000e f,
390.000000e f,
375.000000e f,
360.000000e f,
345.000000e f,
330.000000e f,
315.000000e f,
300.000000e f,
285.000000e f,
270.000000e f,
255.000000e f,
240.000000e f,
225.000000e f,
210.000000e f,
195.000000e f,
180.000000e f,
165.000000e f,
150.000000e f,
135.000000e f,
120.000000e f,
105.000000e f,
90.000000e f,
75.000000e f,
60.000000e f,
45.000000e f,
30.000000e f,
15.000000e f,
0.000000e f,
-15.000000e f,
-30.000000e f,
-45.000000e f,
-60.000000e f,
-75.000000e f,
-90.000000e f,
-105.000000e f,
-120.000000e f,
-135.000000e f,
-150.000000e f,
-165.000000e f,
-180.000000e f,
-195.000000e f,
-210.000000e f,
-225.000000e f,
-240.000000e f,
-255.000000e f,
-270.000000e f,
-285.000000e f,
-300.000000e f,
-315.000000e f,
-330.000000e f,
-345.000000e f,
-360.000000e f,
-375.000000e f,
-390.000000e f,
-405.000000e f,
-420.000000e f,
-435.000000e f,
-450.000000e f,
-465.000000e f,
-480.000000e f,
-495.000000e f,
-510.000000e f,
-525.000000e f,
-540.000000e f,
-555.000000e f,
-570.000000e f,
-585.000000e f,
-600.000000e f,
-615.000000e f,
-630.000000e f,
-645.000000e f,
-660.000000e f,
-675.000000e f,
-690.000000e f,
-705.000000e f,
-720.000000e f,
-735.000000e f,
-750.000000e f,
-765.000000e f,
-780.000000e f,
-795.000000e f,
-810.000000e f,
-825.000000e f,
-840.000000e f,
-855.000000e f,
-870.000000e f,
-885.000000e f,
-900.000000e f,
-915.000000e f,
-930.000000e f,
-945.000000e f,
-960.000000e f,
-975.000000e f,
-990.000000e f,
-1005.000000e f,
-1020.000000e f,
-1035.000000e f,
-1050.000000e f,
-1065.000000e f,
-1080.000000e f,
-1095.000000e f,
-1110.000000e f,
-1125.000000e f,
-1140.000000e f,
-1155.000000e f,
-1170.000000e f,
-1185.000000e f,
-1200.000000e f,
-1215.000000e f,
-1230.000000e f,
-1245.000000e f,
-1260.000000e f,
-1275.000000e f,
-1290.000000e f,
-1305.000000e f,
-1320.000000e f,
-1335.000000e f,
-1350.000000e f,
-1365.000000e f,
-1380.000000e f,

: phase-rev01-interp { f:temp -- }
  temp 128e f+ float>int cells phase-rev01-table + f@ fdup
  temp 129e f+ float>int cells phase-rev01-table + f@
  fswap f-
  temp fdup float>int int>float f- f* f+
;
: amp-rev01-interp one ;
create delay-rev01-table
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
127.000000e f,
126.400000e f,
124.800000e f,
123.200000e f,
121.600000e f,
120.000000e f,
118.400000e f,
116.800000e f,
115.200000e f,
113.600000e f,
112.000000e f,
110.400000e f,
108.800000e f,
107.200000e f,
105.600000e f,
104.000000e f,
102.400000e f,
100.800000e f,
99.200000e f,
97.600000e f,
96.000000e f,
94.400000e f,
92.800000e f,
91.200000e f,
89.600000e f,
88.000000e f,
86.400000e f,
84.800000e f,
83.200000e f,
81.600000e f,
80.000000e f,
78.400000e f,
76.800000e f,
75.200000e f,
73.600000e f,
72.000000e f,
70.400000e f,
68.800000e f,
67.200000e f,
65.600000e f,
64.000000e f,
62.400000e f,
60.800000e f,
59.200000e f,
57.600000e f,
56.000000e f,
54.400000e f,
52.800000e f,
51.200000e f,
49.600000e f,
48.000000e f,
46.400000e f,
44.800000e f,
43.200000e f,
41.600000e f,
40.000000e f,
38.400000e f,
36.800000e f,
35.200000e f,
33.600000e f,
32.000000e f,
30.400000e f,
28.800000e f,
27.200000e f,
25.600000e f,
24.000000e f,
22.400000e f,
20.800000e f,
19.200000e f,
17.600000e f,
16.000000e f,
14.400000e f,
12.800000e f,
11.200000e f,
9.600000e f,
8.000000e f,
6.400000e f,
4.800000e f,
3.200000e f,
1.600000e f,
0.000000e f,
-1.600000e f,
-3.200000e f,
-4.800000e f,
-6.400000e f,
-8.000000e f,
-9.600000e f,
-11.200000e f,
-12.800000e f,
-14.400000e f,
-16.000000e f,
-17.600000e f,
-19.200000e f,
-20.800000e f,
-22.400000e f,
-24.000000e f,
-25.600000e f,
-27.200000e f,
-28.800000e f,
-30.400000e f,
-32.000000e f,
-33.600000e f,
-35.200000e f,
-36.800000e f,
-38.400000e f,
-40.000000e f,
-41.600000e f,
-43.200000e f,
-44.800000e f,
-46.400000e f,
-48.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,
-49.000000e f,

: delay-rev01-interp { f:temp -- }
  temp 128e f+ float>int cells delay-rev01-table + f@ fdup
  temp 129e f+ float>int cells delay-rev01-table + f@
  fswap f-
  temp fdup float>int int>float f- f* f+
;


: set-sinegainnom-rev01 ;
 : set-ampgainnom-rev01 ;
: set-ampnullnom-rev01
  0e 1 set-aux-dac
;
: set-fgdnom-rev01
  0e 2 set-aux-dac
;

variable 'sinegain-rev01-interp ' sinegain-rev01-interp 'sinegain-rev01-interp !
variable 'ampgain-rev01-interp ' ampgain-rev01-interp 'ampgain-rev01-interp !
variable 'ampnull-rev01-interp ' ampnull-rev01-interp 'ampnull-rev01-interp !
variable 'fgd-rev01-interp ' fgd-rev01-interp 'fgd-rev01-interp !
variable 'phase-rev01-interp ' phase-rev01-interp 'phase-rev01-interp !
variable 'amp-rev01-interp ' amp-rev01-interp 'amp-rev01-interp !
variable 'delay-rev01-interp ' delay-rev01-interp 'delay-rev01-interp !

variable 'sinegain-interp ' sinegain-interp 'sinegain-interp !
variable 'ampgain-interp ' ampgain-interp 'ampgain-interp !
variable 'ampnull-interp ' ampnull-interp 'ampnull-interp !
variable 'fgd-interp ' fgd-interp 'fgd-interp !
variable 'phase-interp ' phase-interp 'phase-interp !
variable 'amp-interp ' amp-interp 'amp-interp !
variable 'delay-interp ' delay-interp 'delay-interp !

: config-rev01
    'sinegain-rev01-interp @ sinegaintc-func-low !
    'sinegain-rev01-interp @ sinegaintc-func-high !

    'ampgain-rev01-interp @ ampgaintc-func-low !
    'ampgain-rev01-interp @ ampgaintc-func-high !

    'ampnull-rev01-interp @ ampnulltc-func-low !
    'ampnull-rev01-interp @ ampnulltc-func-high !

    'fgd-rev01-interp @ fgdtc-func-low !
    'fgd-rev01-interp @ fgdtc-func-high !

    'phase-rev01-interp @ phasetc-func-low !
    'phase-rev01-interp @ phasetc-func-high !

    'amp-rev01-interp @ amptc-func-low !
    'amp-rev01-interp @ amptc-func-high !

    'delay-rev01-interp @ delaytc-func-low !
    'delay-rev01-interp @ delaytc-func-high !

    set-sinegainnom-rev01
    set-ampgainnom-rev01
    set-ampnullnom-rev01
    set-fgdnom-rev01

    0 set-amp-invert
    0 set-amp-bias
    .5e set-amp-scale
;

: config-rev-default
    'sinegain-interp @ sinegaintc-func-low !
    'sinegain-interp @ sinegaintc-func-high !

    'ampgain-interp @ ampgaintc-func-low !
    'ampgain-interp @ ampgaintc-func-high !

    'ampnull-interp @ ampnulltc-func-low !
    'ampnull-interp @ ampnulltc-func-high !

    'fgd-interp @ fgdtc-func-low !
    'fgd-interp @ fgdtc-func-high !

    'phase-interp @ phasetc-func-low !
    'phase-interp @ phasetc-func-high !

    'amp-interp @ amptc-func-low !
    'amp-interp @ amptc-func-high !

    'delay-interp @ delaytc-func-low !
    'delay-interp @ delaytc-func-high !

    set-sinegainnom
    set-ampgainnom
    set-ampnullnom
    set-fgdnom
;

: config-rev
  get-board-rev
  2 < if
    config-rev01
  else
    config-rev-default
  then

  get-board-rev
  3 >= if
    0 set-amp-invert
    0x8000 set-amp-bias
    1e set-amp-scale
  then
;



.( Loading default FIR coefficients ) cr
: c, dup 1 cells + swap f! ;
fir-coeff-table
3.47741e-006 c,
2.94613e-005 c,
8.31543e-006 c,
0.000106166e c,
-1.92097e-005 c,
-7.94808e-005 c,
-6.29965e-005 c,
-0.000758388e c,
4.5136e-005 c,
-0.000264019e c,
0.000243379e c,
0.00288232e c,
-3.46922e-005 c,
0.0025803e c,
-0.000632444e c,
-0.00756327e c,
-0.000115642e c,
-0.0105389e c,
0.00122744e c,
0.0151239e c,
0.000509743e c,
0.0312263e c,
-0.00187102e c,
-0.0241983e c,
-0.00114156e c,
-0.0826592e c,
0.00229563e c,
0.0318016e c,
0.00182901e c,
0.309706e c,
-0.00228457e c,
0.465213e c,
forget c,
drop
 
config-rev

load? icat:atten_delay.4th

load? icat:sinegaintc.4th
load? icat:ampgaintc.4th
load? icat:ampnulltc.4th
load? icat:fgdtc.4th
load? icat:phasetc.4th
load? icat:amptc.4th
load? icat:delaytc.4th

load? icat:sinegainnom.4th
load? icat:ampgainnom.4th
load? icat:fgdnom.4th
load? icat:ampnullnom.4th

load? icat:fir.4th
load? icat:noise_scale.4th

boot-icat
1e set-temp-period
configure-icat
255 set-atten-index
-20e6 set-freq
