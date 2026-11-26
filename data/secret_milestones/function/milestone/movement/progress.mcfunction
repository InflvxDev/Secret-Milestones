# Interno: {id}. Fila del panel: km agachado, km corriendo, saltos y saltos fuera de cupo.
$execute store result score #c sm.calc run data get storage secret_milestones:moves p$(id).c
$execute store result score #s sm.calc run data get storage secret_milestones:moves p$(id).s
$execute store result score #j sm.calc run data get storage secret_milestones:moves p$(id).j
$execute store result score #o sm.calc run data get storage secret_milestones:moves p$(id).o
# cm a km. Lo que pasa de la meta no suma para otra, así que se muestra hasta la meta.
scoreboard players operation #c sm.calc /= #100000 sm.calc
scoreboard players operation #s sm.calc /= #100000 sm.calc
execute if score #c sm.calc matches 300.. run scoreboard players set #c sm.calc 300
execute if score #s sm.calc matches 1000.. run scoreboard players set #s sm.calc 1000
execute if score #j sm.calc matches 100000.. run scoreboard players set #j sm.calc 100000
execute store result storage secret_milestones:tmp row.c int 1 run scoreboard players get #c sm.calc
execute store result storage secret_milestones:tmp row.s int 1 run scoreboard players get #s sm.calc
execute store result storage secret_milestones:tmp row.j int 1 run scoreboard players get #j sm.calc
execute store result storage secret_milestones:tmp row.o int 1 run scoreboard players get #o sm.calc
function secret_milestones:milestone/movement/progress_text with storage secret_milestones:tmp row
