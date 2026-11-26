# Interno: {id, d, x, y, z}
$execute store result score #used sm.calc run data get storage secret_milestones:jump_zones p$(id)."$(d)"."$(x),$(y),$(z)"
# Suma lo menor entre los saltos y lo que le queda a la zona
scoreboard players operation #add sm.calc = #jump_cap sm.calc
scoreboard players operation #add sm.calc -= #used sm.calc
execute if score #add sm.calc matches ..-1 run scoreboard players set #add sm.calc 0
scoreboard players operation #add sm.calc < #d sm.calc
scoreboard players operation #used sm.calc += #add sm.calc
$execute if score #add sm.calc matches 1.. store result storage secret_milestones:jump_zones p$(id)."$(d)"."$(x),$(y),$(z)" int 1 run scoreboard players get #used sm.calc
scoreboard players operation @s sm.mj += #add sm.calc
tag @s add sm.msave
# Para el panel: los saltos que quedaron fuera de cupo
scoreboard players operation #d sm.calc -= #add sm.calc
execute if score #d sm.calc matches ..0 run return 0
$execute store result score #n sm.calc run data get storage secret_milestones:moves p$(id).o
scoreboard players operation #n sm.calc += #d sm.calc
$execute store result storage secret_milestones:moves p$(id).o int 1 run scoreboard players get #n sm.calc
