# Interno: {u, ...} (la fila del panel trae el UUID). Qué piezas cobró cada jugador.
scoreboard players set #n sm.calc 0
data modify storage secret_milestones:tmp row.h set value "✘"
data modify storage secret_milestones:tmp row.c set value "✘"
data modify storage secret_milestones:tmp row.l set value "✘"
data modify storage secret_milestones:tmp row.b set value "✘"
$execute if data storage secret_milestones:claimed deep_mine[{u:$(u)}] run data modify storage secret_milestones:tmp row.h set value "✔"
$execute if data storage secret_milestones:claimed hurt[{u:$(u)}] run data modify storage secret_milestones:tmp row.c set value "✔"
$execute if data storage secret_milestones:claimed movement[{u:$(u)}] run data modify storage secret_milestones:tmp row.l set value "✔"
$execute if data storage secret_milestones:claimed farlands[{u:$(u)}] run data modify storage secret_milestones:tmp row.b set value "✔"
$execute if data storage secret_milestones:claimed deep_mine[{u:$(u)}] run scoreboard players add #n sm.calc 1
$execute if data storage secret_milestones:claimed hurt[{u:$(u)}] run scoreboard players add #n sm.calc 1
$execute if data storage secret_milestones:claimed movement[{u:$(u)}] run scoreboard players add #n sm.calc 1
$execute if data storage secret_milestones:claimed farlands[{u:$(u)}] run scoreboard players add #n sm.calc 1
execute store result storage secret_milestones:tmp row.v int 1 run scoreboard players get #n sm.calc
function secret_milestones:milestone/armor_set/progress_text with storage secret_milestones:tmp row
