# Interno: {u, ...} (la fila del panel trae el UUID). Qué herramientas cobró cada jugador.
# El pico vale cualquiera de los dos: Chunk Destroyer o Debris Finder.
scoreboard players set #n sm.calc 0
data modify storage secret_milestones:tmp row.p set value "✘"
data modify storage secret_milestones:tmp row.a set value "✘"
data modify storage secret_milestones:tmp row.s set value "✘"
data modify storage secret_milestones:tmp row.o set value "✘"
$execute if data storage secret_milestones:claimed stone_1m[{u:$(u)}] run data modify storage secret_milestones:tmp row.p set value "✔"
$execute if data storage secret_milestones:claimed debris_beacon[{u:$(u)}] run data modify storage secret_milestones:tmp row.p set value "✔"
$execute if data storage secret_milestones:claimed log_100k[{u:$(u)}] run data modify storage secret_milestones:tmp row.a set value "✔"
$execute if data storage secret_milestones:claimed soil_250k[{u:$(u)}] run data modify storage secret_milestones:tmp row.s set value "✔"
$execute if data storage secret_milestones:claimed harvest[{u:$(u)}] run data modify storage secret_milestones:tmp row.o set value "✔"
execute if data storage secret_milestones:tmp row{p:"✔"} run scoreboard players add #n sm.calc 1
execute if data storage secret_milestones:tmp row{a:"✔"} run scoreboard players add #n sm.calc 1
execute if data storage secret_milestones:tmp row{s:"✔"} run scoreboard players add #n sm.calc 1
execute if data storage secret_milestones:tmp row{o:"✔"} run scoreboard players add #n sm.calc 1
execute store result storage secret_milestones:tmp row.v int 1 run scoreboard players get #n sm.calc
function secret_milestones:milestone/tool_set/progress_text with storage secret_milestones:tmp row
