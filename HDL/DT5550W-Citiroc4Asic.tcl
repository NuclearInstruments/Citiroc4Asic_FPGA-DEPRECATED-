set outputDir C:/OpenHardware/UserProject/DT5550W-Citiroc4Asic/output/DT5550W-Citiroc4Asic
file mkdir $outputDir
create_project DT5550W-Citiroc4Asic C:/OpenHardware/UserProject/DT5550W-Citiroc4Asic/output/DT5550W-Citiroc4Asic -part XC7K160TFFG676-2 -force
set_property target_language VHDL [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
add_files -force pcores/clk_wiz_0.xcix
add_files -force pcores/clk_wiz_0.xcix
add_files -force pcores/DTClockGenerator.xci
add_files -force pcores/fast_clock.xci
add_files -force pcores/fifo_generator_0.xcix
add_files -force pcores/fifo_generator_0.xcix
add_files -force pcores/FlashPageMemory.xci
add_files -force pcores/FTDI_FIFOs.xci
add_files -force pcores/FTDI_FIFO_AW.xci
add_files -force pcores/TestBram.xci
add_files -force C:/OpenHardware/UserProject/DT5550W-Citiroc4Asic/HDL/subpage_Timer64.vhd
add_files -force C:/OpenHardware/UserProject/DT5550W-Citiroc4Asic/HDL/subpage_TriggerLogic.vhd
add_files -force C:/OpenHardware/UserProject/DT5550W-Citiroc4Asic/HDL/top_DT5550W-Citiroc4Asic.vhd
add_files -force pcores/ADC1.v
add_files -force pcores/adcs_top.vhd
add_files -force pcores/adcs_top.vhd
add_files -force pcores/ADC_FRAME_S.vhd
add_files -force pcores/ADC_FRAME_S.vhd
add_files -force pcores/adc_interface.vhd
add_files -force pcores/adc_interface.vhd
add_files -force pcores/adc_sync.vhd
add_files -force pcores/adc_sync.vhd
add_files -force pcores/chronoenable.vhd
add_files -force pcores/chronoenable.vhd
add_files -force pcores/CitirocAnalogReadout.vhd
add_files -force pcores/CitirocAnalogReadout.vhd
add_files -force pcores/CitirocFrameTransfer.vhd
add_files -force pcores/CitirocFrameTransfer.vhd
add_files -force pcores/CitirocSlowControl.vhd
add_files -force pcores/CitirocSlowControl.vhd
add_files -force pcores/counter_rising.vhd
add_files -force pcores/counter_rising.vhd
add_files -force pcores/d_latch.vhd
add_files -force pcores/d_latch.vhd
add_files -force pcores/FlashController.vhd
add_files -force pcores/FlashController.vhd
add_files -force pcores/flash_prog.vhd
add_files -force pcores/flash_prog.vhd
add_files -force pcores/frequency_meter.vhd
add_files -force pcores/frequency_meter.vhd
add_files -force pcores/ft600_fifo245_core.vhd
add_files -force pcores/ft600_fifo245_core.vhd
add_files -force pcores/ft600_fifo245_wrapper.vhd
add_files -force pcores/ft600_fifo245_wrapper.vhd
add_files -force pcores/i2cmaster.vhd
add_files -force pcores/i2cmaster.vhd
add_files -force pcores/init_clock_gen.vhd
add_files -force pcores/init_clock_gen.vhd
add_files -force pcores/MCRateMeter.vhd
add_files -force pcores/MCRateMeter.vhd
add_files -force pcores/PULSE_GENERATOR.vhd
add_files -force pcores/PULSE_GENERATOR.vhd
add_files -force pcores/security.vhd
add_files -force pcores/security.vhd
add_files -force pcores/spi32bit_master_write.vhd
add_files -force pcores/spi32bit_master_write.vhd
add_files -force pcores/spi93lc56_16bit.vhd
add_files -force pcores/spi93lc56_16bit.vhd
add_files -force pcores/spi_timing_module.vhd
add_files -force pcores/spi_timing_module.vhd
add_files -force pcores/TimestampGenerator.vhd
add_files -force pcores/TimestampGenerator.vhd
add_files -force pcores/xlx_oscilloscope_sync.vhd
add_files -force pcores/xlx_oscilloscope_sync.vhd
add_files -force pcores/xlx_soft_gd.vhd
add_files -force pcores/xlx_soft_gd.vhd
add_files -force -fileset constrs_1 C:/OpenHardware/UserProject/DT5550W-Citiroc4Asic/HDL/dt555w_constraints.xdc
import_files -force -norecurse
import_files -fileset constrs_1 -force -norecurse C:/OpenHardware/UserProject/DT5550W-Citiroc4Asic/HDL/dt555w_constraints.xdc
foreach ip [get_ips] {
upgrade_ip [get_ips $ip]
set ip_filename [get_property IP_FILE $ip]
set ip_dcp [file rootname $ip_filename]
append ip_dcp ".dcp"
set ip_xml [file rootname $ip_filename]
append ip_xml ".xml"
if {([file exists $ip_dcp] == 0) || [expr {[file mtime $ip_filename ] > [file mtime $ip_dcp ]}]} {
reset_target all $ip
file delete $ip_xml
generate_target all $ip
synth_ip $ip
}
}
set_property Top top_DT5550W-Citiroc4Asic [current_fileset]
set obj [get_runs impl_1]
set_property -name "steps.write_bitstream.args.bin_file" -value "1" -objects $obj
if {[catch {
launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
} errorstring]} {
Error "ABBA: $errorstring "
exit
}
exit
