open_hw
connect_hw_server
foreach tgrt [get_hw_targets] {
open_hw_target $tgrt
if {[get_hw_devices xc7k160t_0*]  !="" } {
set_property PROBES.FILE {} [lindex [get_hw_devices xc7k160t_0*] 0]
set_property PROGRAM.FILE {C:/OpenHardware/UserProject/DT5550W-Citiroc4Asic/output/DT5550W-Citiroc4Asic/DT5550W-Citiroc4Asic.runs/impl_1/TOP_DT5550WCitiroc4Asic.bit} [lindex [get_hw_devices xc7k160t_0*] 0]
program_hw_devices [lindex [get_hw_devices xc7k160t_0*] 0]
refresh_hw_device [lindex [get_hw_devices xc7k160t_0*] 0]
}
close_hw_target
}
exit
