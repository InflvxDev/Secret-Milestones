# Interno: {label, v}
$data modify storage secret_milestones:tmp ui.actions append value {width:260,label:{text:"$(label)",color:"yellow"},action:{type:"minecraft:run_command",command:"trigger sm.admin set $(v)"}}
