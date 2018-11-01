create rfbb.4th

15217 constant CHECKSUM
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
0x70 constant AMTRead_offset
0x74 constant XOutDelay_offset
0x78 constant PhaseDelay_offset
0x7C constant AmpDelay_offset
0x80 constant PhaseBias_offset
0x84 constant AmpBias_offset
0x88 constant CalibratePhase_offset
0x8C constant SoftwarePhase_offset
0x90 constant SoftwareAmp_offset
0x94 constant SoftwareGates_offset
0x98 constant SoftwareUser_offset
0x9C constant SoftwareAUX_offset
0xA0 constant SoftwareAUXReset_offset
0xA4 constant SoftwareAUXStrobe_offset
0xA8 constant FIFOOutputSelect_offset
0xAC constant FIFOPhase_offset
0xB0 constant FIFOAmp_offset
0xB4 constant FIFOGates_offset
0xB8 constant FIFOUser_offset
0xBC constant FIFOAUX_offset
0xC0 constant AUXRead_offset
0xC4 constant Duration_offset
0xC8 constant Gates_offset
0xCC constant Phase_offset
0xD0 constant PhaseIncrement_offset
0xD4 constant PhaseCount_offset
0xD8 constant PhaseClear_offset
0xDC constant PhaseC_offset
0xE0 constant PhaseCIncrement_offset
0xE4 constant PhaseCCount_offset
0xE8 constant PhaseCClear_offset
0xEC constant Amp_offset
0xF0 constant AmpIncrement_offset
0xF4 constant AmpCount_offset
0xF8 constant AmpClear_offset
0xFC constant AmpScale_offset
0x100 constant AmpScaleIncrement_offset
0x104 constant AmpScaleCount_offset
0x108 constant AmpScaleClear_offset
0x10C constant User_offset
0x110 constant FIFOInstructionWrite_offset
0x114 constant XmitSpiOut_offset
0x118 constant XmitSpiIn_offset
0x11C constant ClearChecksums_offset
0x120 constant PhaseChecksum_offset
0x124 constant AmpChecksum_offset
0x128 constant FifoGateChecksum_offset
0x12C constant TXDChecksum_offset
0x130 constant InvalidInstruction_offset
0x134 constant TransmitterMode_offset
0x138 constant DCMRst_offset
0x13C constant EnableInterfaceRobustness_offset
0x140 constant InterfaceRobustnessPeriod_offset
0x144 constant P2Delay_offset
0x148 constant LoopBufferControl_offset
0x14C constant NumLoops_offset
0x150 constant LinearizationControl_offset
0x154 constant LinearizedAmpValue_offset
0x158 constant LinearizedPhaseValue_offset
0x15C constant CurrentAtten_offset
0x160 constant CurrentLinearizationTable_offset
0x164 constant CurrentMappedAtten_offset
0x168 constant LinearizedAmpScale_offset
0x16C constant OPBDiagControl_offset
0x170 constant OPBAvg0_offset
0x174 constant OPBAvg1_offset
0x178 constant OPBAvg2_offset
0x17C constant OPBAvg3_offset
0x180 constant InvalidInstructionCount_offset
0x184 constant CapturedInstructionFifofCount_offset
0x188 constant CapturedDataFifofCount_offset
0x18C constant DebugVersion_offset
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
32 constant instruction_fifo_high_threshold_width 
0x2C constant instruction_fifo_low_threshold_addr 
0 constant instruction_fifo_low_threshold_pos 
32 constant instruction_fifo_low_threshold_width 
0x30 constant instruction_fifo_count_addr 
0 constant instruction_fifo_count_pos 
32 constant instruction_fifo_count_width 
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
0x5C constant input_fifo_check_status_addr 
14 constant input_fifo_check_status_pos 
1 constant input_fifo_check_status_width 
0x5C constant output_fifo_check_status_addr 
15 constant output_fifo_check_status_pos 
1 constant output_fifo_check_status_width 
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
0x60 constant input_fifo_check_enable_addr 
14 constant input_fifo_check_enable_pos 
1 constant input_fifo_check_enable_width 
0x60 constant output_fifo_check_enable_addr 
15 constant output_fifo_check_enable_pos 
1 constant output_fifo_check_enable_width 
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
0x64 constant input_fifo_check_clear_addr 
14 constant input_fifo_check_clear_pos 
1 constant input_fifo_check_clear_width 
0x64 constant output_fifo_check_clear_addr 
15 constant output_fifo_check_clear_pos 
1 constant output_fifo_check_clear_width 
0x68 constant instr_fifo_count_total_addr 
0 constant instr_fifo_count_total_pos 
32 constant instr_fifo_count_total_width 
0x6C constant clear_instr_fifo_count_total_addr 
0 constant clear_instr_fifo_count_total_pos 
1 constant clear_instr_fifo_count_total_width 
0x70 constant amt_read_addr 
0 constant amt_read_pos 
4 constant amt_read_width 
0x74 constant xout_delay_addr 
0 constant xout_delay_pos 
4 constant xout_delay_width 
0x78 constant phase_delay_addr 
0 constant phase_delay_pos 
4 constant phase_delay_width 
0x7C constant amp_delay_addr 
0 constant amp_delay_pos 
4 constant amp_delay_width 
0x80 constant phase_bias_addr 
0 constant phase_bias_pos 
16 constant phase_bias_width 
0x84 constant amp_bias_addr 
0 constant amp_bias_pos 
16 constant amp_bias_width 
0x88 constant phase_calibration_addr 
0 constant phase_calibration_pos 
1 constant phase_calibration_width 
0x8C constant sw_phase_addr 
0 constant sw_phase_pos 
16 constant sw_phase_width 
0x90 constant sw_amp_addr 
0 constant sw_amp_pos 
16 constant sw_amp_width 
0x94 constant sw_gates_addr 
0 constant sw_gates_pos 
12 constant sw_gates_width 
0x98 constant sw_user_addr 
0 constant sw_user_pos 
3 constant sw_user_width 
0x9C constant sw_aux_addr 
0 constant sw_aux_pos 
12 constant sw_aux_width 
0xA0 constant sw_aux_reset_addr 
0 constant sw_aux_reset_pos 
1 constant sw_aux_reset_width 
0xA4 constant sw_aux_strobe_addr 
0 constant sw_aux_strobe_pos 
1 constant sw_aux_strobe_width 
0xA8 constant fifo_output_select_addr 
0 constant fifo_output_select_pos 
1 constant fifo_output_select_width 
0xAC constant fifo_phase_addr 
0 constant fifo_phase_pos 
16 constant fifo_phase_width 
0xB0 constant fifo_amp_addr 
0 constant fifo_amp_pos 
16 constant fifo_amp_width 
0xB4 constant fifo_gates_addr 
0 constant fifo_gates_pos 
12 constant fifo_gates_width 
0xB8 constant fifo_user_addr 
0 constant fifo_user_pos 
3 constant fifo_user_width 
0xBC constant fifo_aux_addr 
0 constant fifo_aux_pos 
12 constant fifo_aux_width 
0xC0 constant aux_read_addr 
0 constant aux_read_pos 
8 constant aux_read_width 
0xC4 constant holding_duration_addr 
0 constant holding_duration_pos 
26 constant holding_duration_width 
0xC8 constant holding_gates_addr 
0 constant holding_gates_pos 
12 constant holding_gates_width 
0xCC constant holding_phase_addr 
0 constant holding_phase_pos 
16 constant holding_phase_width 
0xD0 constant holding_phase_increment_addr 
0 constant holding_phase_increment_pos 
16 constant holding_phase_increment_width 
0xD4 constant holding_phase_count_addr 
0 constant holding_phase_count_pos 
9 constant holding_phase_count_width 
0xD8 constant holding_phase_clear_addr 
0 constant holding_phase_clear_pos 
1 constant holding_phase_clear_width 
0xDC constant holding_phase_c_addr 
0 constant holding_phase_c_pos 
16 constant holding_phase_c_width 
0xE0 constant holding_phase_c_increment_addr 
0 constant holding_phase_c_increment_pos 
16 constant holding_phase_c_increment_width 
0xE4 constant holding_phase_c_count_addr 
0 constant holding_phase_c_count_pos 
9 constant holding_phase_c_count_width 
0xE8 constant holding_phase_c_clear_addr 
0 constant holding_phase_c_clear_pos 
1 constant holding_phase_c_clear_width 
0xEC constant holding_amp_addr 
0 constant holding_amp_pos 
16 constant holding_amp_width 
0xF0 constant holding_amp_increment_addr 
0 constant holding_amp_increment_pos 
16 constant holding_amp_increment_width 
0xF4 constant holding_amp_count_addr 
0 constant holding_amp_count_pos 
9 constant holding_amp_count_width 
0xF8 constant holding_amp_clear_addr 
0 constant holding_amp_clear_pos 
1 constant holding_amp_clear_width 
0xFC constant holding_amp_scale_addr 
0 constant holding_amp_scale_pos 
16 constant holding_amp_scale_width 
0x100 constant holding_amp_scale_increment_addr 
0 constant holding_amp_scale_increment_pos 
16 constant holding_amp_scale_increment_width 
0x104 constant holding_amp_scale_count_addr 
0 constant holding_amp_scale_count_pos 
9 constant holding_amp_scale_count_width 
0x108 constant holding_amp_scale_clear_addr 
0 constant holding_amp_scale_clear_pos 
1 constant holding_amp_scale_clear_width 
0x10C constant holding_user_addr 
0 constant holding_user_pos 
3 constant holding_user_width 
0x110 constant fifo_instruction_addr 
0 constant fifo_instruction_pos 
32 constant fifo_instruction_width 
0x114 constant xmit_spi_frame_addr 
0 constant xmit_spi_frame_pos 
1 constant xmit_spi_frame_width 
0x114 constant xmit_spi_clk_addr 
1 constant xmit_spi_clk_pos 
1 constant xmit_spi_clk_width 
0x114 constant xmit_spi_data_out_addr 
2 constant xmit_spi_data_out_pos 
1 constant xmit_spi_data_out_width 
0x118 constant xmit_spi_data_in_addr 
0 constant xmit_spi_data_in_pos 
1 constant xmit_spi_data_in_width 
0x11C constant clear_checksum_addr 
0 constant clear_checksum_pos 
1 constant clear_checksum_width 
0x120 constant phase_checksum_addr 
0 constant phase_checksum_pos 
16 constant phase_checksum_width 
0x124 constant amp_checksum_addr 
0 constant amp_checksum_pos 
16 constant amp_checksum_width 
0x128 constant fifo_gate_checksum_addr 
0 constant fifo_gate_checksum_pos 
16 constant fifo_gate_checksum_width 
0x12C constant txd_checksum_addr 
0 constant txd_checksum_pos 
32 constant txd_checksum_width 
0x130 constant invalid_instruction_addr 
0 constant invalid_instruction_pos 
32 constant invalid_instruction_width 
0x134 constant transmitter_mode_addr 
0 constant transmitter_mode_pos 
1 constant transmitter_mode_width 
0x134 constant p2_disable_addr 
1 constant p2_disable_pos 
1 constant p2_disable_width 
0x134 constant console_type_addr 
2 constant console_type_pos 
1 constant console_type_width 
0x138 constant dcm_rst_addr 
0 constant dcm_rst_pos 
1 constant dcm_rst_width 
0x13C constant enable_interface_robustness_addr 
0 constant enable_interface_robustness_pos 
1 constant enable_interface_robustness_width 
0x140 constant interface_robustness_period_addr 
0 constant interface_robustness_period_pos 
16 constant interface_robustness_period_width 
0x144 constant p2_delay_addr 
0 constant p2_delay_pos 
7 constant p2_delay_width 
0x148 constant mark_loop_addr 
0 constant mark_loop_pos 
1 constant mark_loop_width 
0x148 constant finish_loop_addr 
1 constant finish_loop_pos 
1 constant finish_loop_width 
0x14C constant loop_count_addr 
0 constant loop_count_pos 
32 constant loop_count_width 
0x150 constant linearization_enable_addr 
0 constant linearization_enable_pos 
1 constant linearization_enable_width 
0x154 constant lin_fifo_amp_addr 
0 constant lin_fifo_amp_pos 
16 constant lin_fifo_amp_width 
0x158 constant lin_fifo_phase_addr 
0 constant lin_fifo_phase_pos 
16 constant lin_fifo_phase_width 
0x15C constant current_atten_addr 
0 constant current_atten_pos 
8 constant current_atten_width 
0x160 constant current_linearization_table_addr 
0 constant current_linearization_table_pos 
6 constant current_linearization_table_width 
0x164 constant current_mapped_atten_addr 
0 constant current_mapped_atten_pos 
8 constant current_mapped_atten_width 
0x168 constant lkup_amp_scale_addr 
0 constant lkup_amp_scale_pos 
17 constant lkup_amp_scale_width 
0x16C constant opb_diag_reset_addr 
0 constant opb_diag_reset_pos 
1 constant opb_diag_reset_width 
0x170 constant opb_average_0_addr 
0 constant opb_average_0_pos 
12 constant opb_average_0_width 
0x174 constant opb_average_1_addr 
0 constant opb_average_1_pos 
16 constant opb_average_1_width 
0x178 constant opb_average_2_addr 
0 constant opb_average_2_pos 
20 constant opb_average_2_width 
0x17C constant opb_average_3_addr 
0 constant opb_average_3_pos 
24 constant opb_average_3_width 
0x180 constant invalid_instruction_count_addr 
0 constant invalid_instruction_count_pos 
16 constant invalid_instruction_count_width 
0x184 constant captured_instruction_fifo_count_addr 
0 constant captured_instruction_fifo_count_pos 
32 constant captured_instruction_fifo_count_width 
0x188 constant captured_data_fifo_count_addr 
0 constant captured_data_fifo_count_pos 
9 constant captured_data_fifo_count_width 
0x18C constant debug_version_addr 
0 constant debug_version_pos 
16 constant debug_version_width 
0x400 constant table_index_addr 
0 constant table_index_pos 
6 constant table_index_width 
0x800 constant output_tpower_addr 
0 constant output_tpower_pos 
8 constant output_tpower_width 
0xC00 constant scale_factor_addr 
0 constant scale_factor_pos 
17 constant scale_factor_width 

0x70000000 constant fpga
: fpga! fpga + ! ;
: fpga@ fpga + @ ;

: sw-outputs
  0 fifo_output_select_addr fpga!
;

: aux!
  sw-outputs
  8 lshift swap 0xff and or SoftwareAUX_offset fpga!
  0 SoftwareAUXStrobe_offset fpga!
  1 SoftwareAUXStrobe_offset fpga!
;

: aux@
  sw-outputs
  0x8 or 0 swap aux!
  AUXRead_offset fpga@
;

: usleep 10 * 0 do loop ;

: not 0 = ;

\ Creates a blue box register. The action is the function to call when br! is invoked on the register.
\ If there are no side effects then you should just use !
: bbreg ( action reset -- )
  create , ,
;

\ Creates a wrapper for a function which is called whenever the register has a rising edge
: rising-edge-action ( action -- )
  create
    ,
  does> ( value bbreg -- )
    -rot
    2dup
    @ invert and if
      ! @ execute
    else
      ! drop
    then
;

\
\ hardware interface
\

: br! ( value bbreg -- )
  dup 1 cells + @ execute
;

: br@ ( bbreg -- value )
  @
;

\
\ DDS send machine
\
' ! 0 bbreg VFS_atten_addr
' ! 0 bbreg VFS_freq_addr
' ! 0 bbreg VFS_ftw1_high_addr
' ! 0 bbreg VFS_ftw1_low_addr
' ! 0 bbreg VFS_ftw1_mid_addr
' ! 0 bbreg VFS_ftw2_high_addr
' ! 0 bbreg VFS_ftw2_low_addr
' ! 0 bbreg VFS_rfsw_high_addr
' ! 0 bbreg VFS_rfsw_low_addr

\ The action which takes place on the rising edge to the amrs_dds_send register
: amrs-dds-send-function
  0x52 0 aux!
  0x01 0 aux!
  VFS_ftw1_low_addr br@ dup
  0xff and 0 aux!
  8 rshift 0xff and 0 aux!
  VFS_ftw1_mid_addr br@ dup
  0xff and 0 aux!
  8 rshift 0xff and 0 aux!
  VFS_ftw1_high_addr br@ dup
  0xff and 0 aux!
  8 rshift 0xff and 0 aux!
  VFS_ftw2_low_addr br@ dup
  0xff and 0 aux!
  8 rshift 0xff and 0 aux!
  VFS_ftw2_high_addr br@ dup
  0xff and 0 aux!
  8 rshift 0xff and 0 aux!
  VFS_rfsw_low_addr br@ dup
  0xff and 0 aux!
  8 rshift 0xff and 0 aux!
  VFS_rfsw_high_addr br@ dup
  0xff and 0 aux!
  VFS_atten_addr br@ 0xff and 0 aux!
  VFS_freq_addr br@ dup
  0xff and 0 aux!
  8 rshift 0xff and 0 aux!
  1 1 aux!
;

\ Create the edge triggered action
' amrs-dds-send-function rising-edge-action amrs-dds-send-action

\ Create the register
' amrs-dds-send-action
    0 bbreg VFS_dds_send_addr

\
\ Generic packet registers
\
' ! 0 bbreg VFS_packet_data0_addr
' ! 0 bbreg VFS_packet_data1_addr
' ! 0 bbreg VFS_packet_type_addr

: amrs-packet-send-function
  VFS_packet_type_addr br@ 0 aux!
  VFS_packet_data0_addr br@ dup
  8 rshift 0xff and 0 aux!
  0xff and 0 aux!
  VFS_packet_data1_addr br@ dup
  8 rshift 0xff and 0 aux!
  0xff and 0 aux!
  1 1 aux!
;

' amrs-packet-send-function rising-edge-action amrs-packet-send-action

' amrs-packet-send-action
    0 bbreg VFS_packet_send_addr

\
\ Read send machine
\
' ! 0 bbreg VFS_amrs_read_addr_addr
' ! 0 bbreg VFS_amrs_read_data_addr

: amrs-read-send-function
  0xc2 0 aux!
  VFS_amrs_read_addr_addr br@ 0xff and 0 aux!
  1 1 aux!
  2 aux@ 3 aux@ 8 lshift or
  VFS_amrs_read_data_addr br!
;

' amrs-read-send-function rising-edge-action amrs-read-send-action

' amrs-read-send-action
    0 bbreg VFS_amrs_read_send_addr

\
\ EEPROM send machine
\
' ! 0 bbreg VFS_eeprom_command_addr
' ! 0 bbreg VFS_eeprom_data_out_addr

: amrs-eeprom-send-function
  0x85 0 aux!
  VFS_eeprom_command_addr br@ dup
  8 rshift 0xff and 0 aux!
  0xff and 0 aux!
  VFS_eeprom_data_out_addr br@ dup
  8 rshift 0xff and 0 aux!
  0xff and 0 aux!
  1 1 aux!
;

' amrs-eeprom-send-function rising-edge-action amrs-eeprom-send-action

' amrs-eeprom-send-action
    0 bbreg VFS_eeprom_send_addr


0 constant amrs-version

0x200 constant amrs-atten-base-addr
40e6 fconstant amrs-atten-min-freq
999e6 fconstant amrs-atten-max-freq
1e6 fconstant amrs-atten-freq-scale

: amrs-freq-index ( f:freq - addr )
  fdup amrs-atten-min-freq f< if
    fdrop amrs-atten-min-freq
  then

  fdup amrs-atten-max-freq f> if
    fdrop amrs-atten-max-freq
  then

  amrs-atten-min-freq f- amrs-atten-freq-scale f/ float>int
;

: amrs-index-freq ( addr - f:freq )
  int>float amrs-atten-freq-scale f* amrs-atten-min-freq f+
;

: ftw1!
  dup VFS_ftw1_mid_addr br!
  16 rshift VFS_ftw1_high_addr br!
;

: ftw1@
  VFS_ftw1_mid_addr br@
  VFS_ftw1_high_addr br@ 16 lshift or
;

: ftw2!
  VFS_ftw2_high_addr br!
;

: ftw2@
  VFS_ftw2_high_addr br@
;

: rfswitch!
  dup VFS_rfsw_low_addr br!
  16 rshift VFS_rfsw_high_addr br!
;

: rfswitch@
  VFS_rfsw_low_addr br@
  VFS_rfsw_high_addr br@ 16 lshift or
;

: freq! ( f:freq -- )
  amrs-freq-index
  VFS_freq_addr br!
;

: freq@ ( -- f:freq )
  VFS_freq_addr br@
  amrs-index-freq
;

: atten! ( atten -- )
  VFS_atten_addr br!
;

: atten@ ( -- atten )
  VFS_atten_addr br@
;

: send-dds
  0 VFS_dds_send_addr br!
  1 VFS_dds_send_addr br!
;

: amrs-read-data
  VFS_amrs_read_addr_addr br!
  0 VFS_amrs_read_send_addr br!
  1 VFS_amrs_read_send_addr br!
  VFS_amrs_read_data_addr br@
;

variable amrs-eeprom-delay
10000 amrs-eeprom-delay !

: amrs-eeprom-send
  0 VFS_eeprom_send_addr br!
  1 VFS_eeprom_send_addr br!
  amrs-eeprom-delay @ usleep
;

: amrs-eeprom-send-command
  VFS_eeprom_command_addr br!
  amrs-eeprom-send
;
  
: amrs-eeprom-ewen
  0x1300 amrs-eeprom-send-command
;

: amrs-eeprom-ewds
  0x1000  amrs-eeprom-send-command
;

: amrs-eeprom-wral
  0x1100  amrs-eeprom-send-command
;

: amrs-eeprom-eral
  0x1200  amrs-eeprom-send-command
;

: amrs-eeprom-erase
  0x3ff and
  0x1c00 or
  amrs-eeprom-send-command
;

: amrs-eeprom-write
  swap VFS_eeprom_data_out_addr br!
  0x3ff and
  0x1400 or
  amrs-eeprom-send-command
;

: amrs-eeprom-read
  0x3ff and 0x1800 or
  amrs-eeprom-send-command
  1 amrs-read-data
;

: amrs-packet-send
  0 VFS_packet_send_addr br!
  1 VFS_packet_send_addr br!
;

: amrs-ad9852-write
  0x44 VFS_packet_type_addr br!
  0xff and 0x1000 or VFS_packet_data0_addr br!
  8 lshift VFS_packet_data1_addr br!
  amrs-packet-send
;

: amrs-ad9852-read
  0x43 VFS_packet_type_addr br!
  0xff and 0x1200 or VFS_packet_data0_addr br!
  amrs-packet-send
  2 amrs-read-data
;

: amrs-ad9852-update
  0x42 VFS_packet_type_addr br!
  0x1400 VFS_packet_data0_addr br!
  amrs-packet-send
;

: amrs-ftw1!
  dup           0xff and 9 amrs-ad9852-write
  dup  8 rshift 0xff and 8 amrs-ad9852-write
  dup 16 rshift 0xff and 7 amrs-ad9852-write
      24 rshift 0xff and 6 amrs-ad9852-write
;  

: amrs-ftw1@
  9 amrs-ad9852-read
  8 amrs-ad9852-read 8 lshift or
  7 amrs-ad9852-read 16 lshift or
  6 amrs-ad9852-read 24 lshift or
;  

: amrs-ad9858-write
  0x44 VFS_packet_type_addr br!
  0xff and 0x1100 or VFS_packet_data0_addr br!
  8 lshift VFS_packet_data1_addr br!
  amrs-packet-send
;

: amrs-ad9858-read
  0x43 VFS_packet_type_addr br!
  0xff and 0x1300 or VFS_packet_data0_addr br!
  amrs-packet-send
  2 amrs-read-data
;

: amrs-ad9858-update
  0x42 VFS_packet_type_addr br!
  0x1500 VFS_packet_data0_addr br!
  amrs-packet-send
;

: amrs-ftw2!
  dup           0xff and 10 amrs-ad9858-write
  dup  8 rshift 0xff and 11 amrs-ad9858-write
  dup 16 rshift 0xff and 12 amrs-ad9858-write
  dup 24 rshift 0xff and 13 amrs-ad9858-write
;

: amrs-ftw2@
  10 amrs-ad9858-read
  11 amrs-ad9858-read 8 lshift or
  12 amrs-ad9858-read 16 lshift or
  13 amrs-ad9858-read 24 lshift or
;

\ writes one of the three rfswitch bytes (0-2) or the atten byte (3)
: amrs-rfswitch-write
  0x43 VFS_packet_type_addr br!
  0x3 and 8 lshift 0x1800 or
  swap 0xff and or
  VFS_packet_data0_addr br!
  amrs-packet-send
;

: amrs-rfswitch-read
  0x3 and 4 + amrs-read-data
;

: amrs-rfswitch!
  dup 0xff and
  0 amrs-rfswitch-write
  dup 8 rshift 0xff and
  1 amrs-rfswitch-write
  16 rshift 0xff and
  2 amrs-rfswitch-write
;

: amrs-rfswitch@
  0 amrs-rfswitch-read
  1 amrs-rfswitch-read 8 lshift or
  2 amrs-rfswitch-read 16 lshift or
;

: amrs-freq@ ( -- f:freq )
  8 amrs-read-data 
  amrs-index-freq
;

: amrs-freq! ( f:freq -- )
  amrs-freq-index dup
  0x44 VFS_packet_type_addr br!
  8 rshift 0x1700 or VFS_packet_data0_addr br!
  8 lshift VFS_packet_data1_addr br!
  amrs-packet-send
;

: amrs-control-write
  0x43 VFS_packet_type_addr br!
  0xff and 0x1600 or
  VFS_packet_data0_addr br!
  amrs-packet-send
;

: amrs-control-read
  3 amrs-read-data
;

: amrs-atten-read ( -- atten )
  7 amrs-read-data
;

: amrs-atten-write ( atten -- )
  0x3f and
  3 amrs-rfswitch-write
;

: amrs-atten@ amrs-atten-read ;
: amrs-atten! amrs-atten-write ;

: amrs-init
  0x24 0x1d amrs-ad9852-write
  0x20 0x1e amrs-ad9852-write
  0x00 0x1f amrs-ad9852-write
  0x00 0x20 amrs-ad9852-write
  amrs-ad9852-update
  0x78 0x00 amrs-ad9858-write
  0x00 0x01 amrs-ad9858-write
  0x00 0x02 amrs-ad9858-write
  0x00 0x03 amrs-ad9858-write
  amrs-ad9858-update
;

: amrs-format-ad9852-write
  0x3f and 8 lshift 0x4000 or or
;

: amrs-format-ad9858-write
  0x3f and 8 lshift 0x8000 or or
;

: amrs-format-rfswitch-write
  3 and 8 lshift 0x0400 or or
;

: amrs-format-atten-write
  0x3f and 0x0700 or
;

: amrs-format-freq-write ( f:freq -- )
  amrs-freq-index 0x0c00 or
;

: amrs-format-control-write
  0xff and 0x0800 or
;

0x0100 constant amrs-format-ad9852-update
0x0200 constant amrs-format-ad9858-update

: commit-init-word ( addr init-word -- addr+1 )
  over amrs-eeprom-write 1+
;

: amrs-set-init ( -- )
  \ Reads the current settings and commits them to EEPROM
  \ Subsequent power on will use this setting for initial values.

  amrs-eeprom-ewen
  0x3e0

  \ AD9852 CONFIG
  0x24 0x1d amrs-format-ad9852-write commit-init-word
  0x20 0x1e amrs-format-ad9852-write commit-init-word
  0x00 0x1f amrs-format-ad9852-write commit-init-word
  0x00 0x20 amrs-format-ad9852-write commit-init-word

  \ AD9858 CONFIG
  0x78 0x00 amrs-format-ad9858-write commit-init-word
  0x00 0x01 amrs-format-ad9858-write commit-init-word
  0x00 0x02 amrs-format-ad9858-write commit-init-word
  0x00 0x03 amrs-format-ad9858-write commit-init-word

  \ AD9852 FTW1
  0x09 dup amrs-ad9852-read swap amrs-format-ad9852-write commit-init-word
  0x08 dup amrs-ad9852-read swap amrs-format-ad9852-write commit-init-word
  0x07 dup amrs-ad9852-read swap amrs-format-ad9852-write commit-init-word
  0x06 dup amrs-ad9852-read swap amrs-format-ad9852-write commit-init-word
  0x05 dup amrs-ad9852-read swap amrs-format-ad9852-write commit-init-word
  0x04 dup amrs-ad9852-read swap amrs-format-ad9852-write commit-init-word
  amrs-format-ad9852-update commit-init-word

  \ AD9858 FTW2
  0x0a dup amrs-ad9858-read swap amrs-format-ad9858-write commit-init-word
  0x0b dup amrs-ad9858-read swap amrs-format-ad9858-write commit-init-word
  0x0c dup amrs-ad9858-read swap amrs-format-ad9858-write commit-init-word
  0x0d dup amrs-ad9858-read swap amrs-format-ad9858-write commit-init-word
  amrs-format-ad9858-update commit-init-word

  \ RFSWITCH
  0 dup amrs-rfswitch-read swap amrs-format-rfswitch-write commit-init-word
  1 dup amrs-rfswitch-read swap amrs-format-rfswitch-write commit-init-word
  2 dup amrs-rfswitch-read swap amrs-format-rfswitch-write commit-init-word

  \ Attenuator
  amrs-atten-read amrs-format-atten-write commit-init-word

  \ Frequency
  amrs-freq@ amrs-format-freq-write commit-init-word

  \ Control word
  amrs-control-read amrs-format-control-write commit-init-word

  \ Clear remaining space
  0x400 swap do 0 i amrs-eeprom-write loop
;

\ Attenuator values start at 0x200. Each 16-bit word stores two
\ attenuator entries. The even entry is on the low 8 bits and the
\ odd entry is at the high eight bits.  The first entry is for
\ frequencies [0-21MHz) the second is for [21-22) and so on. The
\ maximum table address is 0x3df. This entry is for frequencies 1GHz
\ and up.

: amrs-atten-value-addr ( f:freq - hi/lo addr )
  amrs-freq-index
  dup 1 and swap 2/
  amrs-atten-base-addr + 
;

: amrs-atten-value ( f:freq - atten )
  amrs-atten-value-addr amrs-eeprom-read
  swap if 8 rshift else 0xff and then
;

: amrs-set-atten-value ( f:freq value -- )
  amrs-eeprom-ewen
  fdup
  amrs-atten-value-addr ( f:freq value hi/lo addr -- )
  amrs-eeprom-read	( f:freq value hi/lo atten/atten -- )
  swap if		( f:freq value atten/atten )
    0x00ff and swap 8 lshift or	( f:freq value/atten )
  else
    0xff00 and swap or	( f:freq atten/value )
  then
  amrs-atten-value-addr	( atten hi/lo addr )
  swap drop		( atten addr )
  amrs-eeprom-write
;

: amrs-fill-atten-values ( atten -- )
  amrs-eeprom-ewen
  dup 8 lshift or
  0x3e0 0x200 do dup i amrs-eeprom-write loop
  drop
;

: amrs-prep-freq ( f:freq -- )
  fdup ftw1 ftw1!
  fdup ftw2 ftw2!
  fdup rfswitch rfswitch!
  freq!
;

: sfreq ( f:freq -- )
  fdup amrs-prep-freq
  amrs-atten-value atten!
  send-dds
;

: sweepfreq ( freq-low freq-high -- )
  1+ swap
  do
    i int>float amrs-atten-freq-scale f* sfreq
    1200 usleep
  loop
;

: amrs-device-status
  base @ 16 base !
  ." FREQ:"
  amrs-freq@ f. cr
  ." FTW1:"
  amrs-ftw1@
  5 amrs-ad9852-read
  4 amrs-ad9852-read 8 lshift or
  <# #s #> type 
  space
  amrs-ftw2@
  ." FTW2:" . space
  amrs-rfswitch@
  ." RFSW:" . space
  amrs-atten@
  ." ATTEN:" .
  cr
  amrs-control-read
  dup 0x4 and if 
    ." amrs-heartbeat-on"
  else
    ." amrs-heartbeat-off"
  then
  dup 0x18 and if
    ."  amrs-alt-power-down"
  else
    ."  amrs-alt-power-up"
  then
  0x20 and if
    ."  amrs-atten-lockout-on"
  else
    ."  amrs-atten-lockout-off"
  then
  cr
  base !
;

: amrs-heartbeat-on
  amrs-control-read
  0x4 or
  amrs-control-write
;

: amrs-heartbeat-off
  amrs-control-read
  0x4 invert and
  amrs-control-write
;

: amrs-atten-lockout-on
  amrs-control-read
  0x20 or
  amrs-control-write
;

: amrs-atten-lockout-off
  amrs-control-read
  0x20 invert and
  amrs-control-write
;

: amrs-alt-power-down
  amrs-control-read
  0x18 or
  amrs-control-write
;

: amrs-alt-power-up
  amrs-control-read
  0x18 invert and
  amrs-control-write
;

16 constant amrs-info-max-len
8 constant amrs-info-num

create amrs-info-buffer amrs-info-max-len 1 cells + allot
variable info-length

: clip ( value max -- value )
  2dup > if swap then drop
  dup
  0 < if drop 0 then
;

: amrs-info-write { ptr size addr -- }
  amrs-info-max-len 0 do
    0
    i size < if
      ptr i + c@ 8 lshift or
    then
    i 1+ size < if
      ptr i + 1+ c@ or
    then
    addr amrs-info-max-len * i 2/ + amrs-eeprom-write
  2 +loop
;


: amrs-info-read { addr -- ptr size }
  amrs-info-max-len 0 do
    addr amrs-info-max-len * i 2/ + amrs-eeprom-read
    dup 8 rshift amrs-info-buffer i + c!
    0xff and amrs-info-buffer i + 1+ c!
  2 +loop
  amrs-info-buffer dup strlen
;

: amrs-part-number-write 0 amrs-info-write ;
: amrs-edc-write 1 amrs-info-write ;
: amrs-supplier-code-write 2 amrs-info-write ;
: amrs-year-and-week-write 3 amrs-info-write ;
: amrs-serial-number-write 4 amrs-info-write ;

: amrs-part-number-read 0 amrs-info-read ;
: amrs-edc-read 1 amrs-info-read ;
: amrs-supplier-code-read 2 amrs-info-read ;
: amrs-year-and-week-read 3 amrs-info-read ;
: amrs-serial-number-read 4 amrs-info-read ;

: amrs-info-sep 0x2d emit ;
: amrs-info-type
  amrs-part-number-read type amrs-info-sep
  amrs-edc-read type amrs-info-sep
  amrs-supplier-code-read type amrs-info-sep
  amrs-year-and-week-read type amrs-info-sep
  amrs-serial-number-read type cr
;


: amrs-status
  amrs-info-type
  amrs-device-status
;

: amrs-default-atten
  -1
  0x400 0x3e0 do
    i amrs-eeprom-read
    dup 0xff00 and
    0 amrs-format-atten-write =
    if
      swap drop 0x3f and
    else
      drop
    then
  loop
;

: amrs-board-rev
  0 amrs-read-data 2 rshift 0x3f and
;

: amrs-channel-id
  0 amrs-read-data 3 and
;

: amrs-rx
  0 amrs-read-data 8 rshift 3 and
;

: amrs-tx
  amrs-control-read
  3 and or
  amrs-control-write
;

: amrs-tx@
  amrs-control-read 3 and
;

: print-atten-table
  0 do
    40e i f+i 1e6 f*
    fdup amrs-atten-value
    f. ." , " . cr
  loop
;
