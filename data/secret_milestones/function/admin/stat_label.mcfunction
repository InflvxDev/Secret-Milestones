# Interno: {id}. Botón de la estadística según si está activa y si está StatsCraft (tmp ui.actions[3])
$execute if data storage secret_milestones:link on.$(id) run data modify storage secret_milestones:tmp ui.actions[3].label set value {text:"Desactivar estadística",color:"red"}
execute unless data storage secret_milestones:link statscraft run data modify storage secret_milestones:tmp ui.actions[3].label.color set value "dark_gray"
execute unless data storage secret_milestones:link statscraft run data modify storage secret_milestones:tmp ui.actions[3].tooltip set value {text:"StatsCraft no está instalado: sin él no se pueden mostrar las estadísticas.",color:"red"}
