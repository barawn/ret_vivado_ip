# These are just being done one-by-one until I find all of them
# then it will be a blanket clk-to-clk ignore
# well, maybe. It might be smarter to leave these all individual just to catch any
# additional mistakes.

# this is actually not correct, it's creating a TON more false paths
# but it's close enough!
set sync_flag_regs [get_cells -hier -filter {NAME =~ *FlagToggle_clkA_reg*}]
set sync_sync_regs [get_cells -hier -filter {NAME =~ *SyncA_clkB_reg*}]
set sync_syncB_regs [get_cells -hier -filter {NAME =~ *SyncB_clkA_reg*}]

set_max_delay -datapath_only -from $sync_flag_regs -to $sync_sync_regs 10.000
set_max_delay -datapath_only -from $sync_sync_regs -to $sync_syncB_regs 10.000

set counter_regs_f [get_cells -hier -filter {NAME =~ *processSurfaceTriggerRevB*/counter_reg*_reg[*]}]
set buff_regs_f [get_cells -hier -filter {NAME =~ *processSurfaceTriggerRevB*/trig_out_buff_reg[*]}]
set slv_regs_a [get_cells -hier -filter {NAME =~ *processSurfaceTriggerRevB*/slv_reg*_reg[*]}]
set_max_delay -datapath_only -from $buff_regs_f -to $slv_regs_a 10.000
set_max_delay -datapath_only -from $counter_regs_f -to $slv_regs_a 10.000

set delay_regs_a [get_cells -hier -filter {NAME =~ *rxGateControl*/delay_value_aclk_reg[*]}]
set delay_regs_f [get_cells -hier -filter {NAME =~ *rxGateControl*/delay_value_reg[*]}]
set high_width_a [get_cells -hier -filter {NAME =~ *rxGateControl*/high_width_value_aclk_reg[*]}]
set high_width_f [get_cells -hier -filter {NAME =~ *rxGateControl*/high_width_value_reg[*]}]
set low_width_a  [get_cells -hier -filter {NAME =~ *rxGateControl*/low_width_value_aclk_reg[*]}]
set low_width_f  [get_cells -hier -filter {NAME =~ *rxGateControl*/low_width_value_reg[*]}]
set_max_delay -datapath_only -from $delay_regs_a -to $delay_regs_f 10.000
set_max_delay -datapath_only -from $high_width_a -to $high_width_f 10.000
set_max_delay -datapath_only -from $low_width_a -to $low_width_f 10.000

set counter_out_regs_f [get_cells -hier -filter {NAME =~ *rxGateControl*/counter_out_reg[*]}]
set counter_out_regs_a [get_cells -hier -filter {NAME =~ *rxGateControl*/counter_out_aclk_reg[*]}]
set_max_delay -datapath_only -from $counter_out_regs_f -to $counter_out_regs_a 10.000

set lockout_regs_a [get_cells -hier -filter {NAME =~ *processSurfaceTriggerRevB*/ext_trig_lockout_aclk_reg[*]}]
set lockout_regs_f [get_cells -hier -filter {NAME =~ *processSurfaceTriggerRevB*/ext_trig_lockout_reg[*]}]
set_max_delay -datapath_only -from $lockout_regs_a -to $lockout_regs_f 10.000

set processed_regs_a [get_cells -hier -filter {NAME =~ *processSurfaceTriggerRevB*/trig_processed_aclk_reg*}]
set processed_regs_f [get_cells -hier -filter {NAME =~ *processSurfaceTriggerRevB*/trig_processed_fclk_reg*}]
set_max_delay -datapath_only -from $processed_regs_a -to $processed_regs_f 10.000
