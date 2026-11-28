# Interno: {id}
$execute if data storage secret_milestones:link on.$(id) run return run function secret_milestones:admin/stat_off with storage secret_milestones:tmp m
$data modify storage secret_milestones:link on.$(id) set value 1b
data modify storage secret_milestones:tmp status set value {text:"✔ Estadística activada: los jugadores ya ven este hito en StatsCraft (sin el nombre de la recompensa ni la meta).",color:"green"}
