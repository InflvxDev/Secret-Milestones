# Interno: {id}. Fila del panel: corazones de cada tipo y fuera de cupo.
$execute store result score #a sm.calc run data get storage secret_milestones:hurt p$(id).mel
$execute store result score #b sm.calc run data get storage secret_milestones:hurt p$(id).pro
$execute store result score #c sm.calc run data get storage secret_milestones:hurt p$(id).exp
$execute store result score #e sm.calc run data get storage secret_milestones:hurt p$(id).fir
$execute store result score #f sm.calc run data get storage secret_milestones:hurt p$(id).bos
$execute store result score #o sm.calc run data get storage secret_milestones:hurt p$(id).o
# Décimas de vida a corazones (1 corazón = 20). Lo que pasa de la meta no suma para otra.
scoreboard players operation #a sm.calc /= #20 sm.calc
scoreboard players operation #b sm.calc /= #20 sm.calc
scoreboard players operation #c sm.calc /= #20 sm.calc
scoreboard players operation #e sm.calc /= #20 sm.calc
scoreboard players operation #f sm.calc /= #20 sm.calc
scoreboard players operation #o sm.calc /= #20 sm.calc
execute if score #a sm.calc matches 50000.. run scoreboard players set #a sm.calc 50000
execute if score #b sm.calc matches 25000.. run scoreboard players set #b sm.calc 25000
execute if score #c sm.calc matches 10000.. run scoreboard players set #c sm.calc 10000
execute if score #e sm.calc matches 10000.. run scoreboard players set #e sm.calc 10000
execute if score #f sm.calc matches 5000.. run scoreboard players set #f sm.calc 5000
execute store result storage secret_milestones:tmp row.a int 1 run scoreboard players get #a sm.calc
execute store result storage secret_milestones:tmp row.b int 1 run scoreboard players get #b sm.calc
execute store result storage secret_milestones:tmp row.c int 1 run scoreboard players get #c sm.calc
execute store result storage secret_milestones:tmp row.e int 1 run scoreboard players get #e sm.calc
execute store result storage secret_milestones:tmp row.f int 1 run scoreboard players get #f sm.calc
execute store result storage secret_milestones:tmp row.o int 1 run scoreboard players get #o sm.calc
function secret_milestones:milestone/hurt/progress_text with storage secret_milestones:tmp row
