# Interno: {id}. Marca en la lista los hitos con la estadística activa
$execute if data storage secret_milestones:link on.$(id) run data modify storage secret_milestones:tmp ui.actions[-1].label.extra append value {text:"  ◆ Estadística",color:"green"}
$execute if data storage secret_milestones:link on.$(id) run data modify storage secret_milestones:tmp ui.actions[-1].tooltip.extra set value [{text:"\nSu estadística está activa en StatsCraft.",color:"green"}]
