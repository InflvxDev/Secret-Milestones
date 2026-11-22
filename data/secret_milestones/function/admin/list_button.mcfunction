# Interno: {i, v} botón [ícono] Nombre, con la condición al pasar el ratón
$data modify storage secret_milestones:tmp m set from storage secret_milestones:db milestones[$(i)]
$data modify storage secret_milestones:tmp ui.actions append value {width:260,label:{text:"",extra:[{type:"object",object:"atlas",atlas:"minecraft:items",sprite:"item/paper",color:"white"},{text:" "},{text:"",color:"white"}]},tooltip:{text:"",color:"gray"},action:{type:"minecraft:run_command",command:"trigger sm.admin set $(v)"}}
data modify storage secret_milestones:tmp ui.actions[-1].label.extra[0].sprite set from storage secret_milestones:tmp m.sprite
data modify storage secret_milestones:tmp ui.actions[-1].label.extra[2].text set from storage secret_milestones:tmp m.name
data modify storage secret_milestones:tmp ui.actions[-1].label.extra[2].color set from storage secret_milestones:tmp m.color
data modify storage secret_milestones:tmp ui.actions[-1].tooltip.text set from storage secret_milestones:tmp m.goal
