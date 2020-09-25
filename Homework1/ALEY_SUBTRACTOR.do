onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider INPUTS
add wave -noupdate /tb_williams_subtractor/OP_A
add wave -noupdate /tb_williams_subtractor/OP_B
add wave -noupdate /tb_williams_subtractor/CLK
add wave -noupdate -divider OUTPUTS
add wave -noupdate /tb_williams_subtractor/OP_Q
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /tb_williams_subtractor/Exp_Op_Q
add wave -noupdate /tb_williams_subtractor/OP_Q
add wave -noupdate /tb_williams_subtractor/Test_Out_Q
add wave -noupdate /tb_williams_subtractor/LineNumber
add wave -noupdate /tb_williams_subtractor/U0/CLK
add wave -noupdate -divider INSTANTIATIONS
add wave -noupdate /tb_williams_subtractor/InstWILLIAMS_SUBTRACTOR/OP_A
add wave -noupdate /tb_williams_subtractor/InstWILLIAMS_SUBTRACTOR/OP_B
add wave -noupdate /tb_williams_subtractor/InstWILLIAMS_SUBTRACTOR/OP_Q
add wave -noupdate /tb_williams_subtractor/InstWILLIAMS_SUBTRACTOR/S_D
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 265
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {104 ns}
