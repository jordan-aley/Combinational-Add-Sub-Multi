onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider INPUTS
add wave -noupdate /tb_williams_adderr/OP_A
add wave -noupdate /tb_williams_adderr/OP_B
add wave -noupdate /tb_williams_adderr/CLK
add wave -noupdate -divider OUTPUTS
add wave -noupdate /tb_williams_adderr/OP_Q
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /tb_williams_adderr/OP_Q
add wave -noupdate /tb_williams_adderr/Exp_Op_Q
add wave -noupdate /tb_williams_adderr/Test_Out_Q
add wave -noupdate /tb_williams_adderr/LineNumber
add wave -noupdate /tb_williams_adderr/U0/CLK
add wave -noupdate -divider INSTANTIATIONS
add wave -noupdate /tb_williams_adderr/InstWILLIAMS_ADDERR/OP_A
add wave -noupdate /tb_williams_adderr/InstWILLIAMS_ADDERR/OP_B
add wave -noupdate /tb_williams_adderr/InstWILLIAMS_ADDERR/OP_Q
add wave -noupdate /tb_williams_adderr/InstWILLIAMS_ADDERR/S_D
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 278
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
WaveRestoreZoom {0 ns} {102 ns}
