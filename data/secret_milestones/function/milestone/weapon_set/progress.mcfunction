# Interno: {u, ...} (la fila del panel trae el UUID). Qué armas cobró cada jugador.
scoreboard players set #n sm.calc 0
data modify storage secret_milestones:tmp row.b set value "✘"
data modify storage secret_milestones:tmp row.s set value "✘"
data modify storage secret_milestones:tmp row.m set value "✘"
$execute if data storage secret_milestones:claimed bow_all[{u:$(u)}] run data modify storage secret_milestones:tmp row.b set value "✔"
$execute if data storage secret_milestones:claimed armor_set[{u:$(u)}] run data modify storage secret_milestones:tmp row.s set value "✔"
$execute if data storage secret_milestones:claimed tool_set[{u:$(u)}] run data modify storage secret_milestones:tmp row.m set value "✔"
execute if data storage secret_milestones:tmp row{b:"✔"} run scoreboard players add #n sm.calc 1
execute if data storage secret_milestones:tmp row{s:"✔"} run scoreboard players add #n sm.calc 1
execute if data storage secret_milestones:tmp row{m:"✔"} run scoreboard players add #n sm.calc 1
execute store result storage secret_milestones:tmp row.v int 1 run scoreboard players get #n sm.calc
function secret_milestones:milestone/weapon_set/progress_text with storage secret_milestones:tmp row
