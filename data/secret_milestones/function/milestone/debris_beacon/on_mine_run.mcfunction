# Interno: {id, d, x, y, z}. #left = lo natural.
$execute store result score #used sm.calc run data get storage secret_milestones:debris_zones p$(id)."$(d)"."$(x),$(y),$(z)"
scoreboard players operation #add sm.calc = #debris_cap sm.calc
scoreboard players operation #add sm.calc -= #used sm.calc
execute if score #add sm.calc matches ..-1 run scoreboard players set #add sm.calc 0
scoreboard players operation #add sm.calc < #left sm.calc
scoreboard players operation #used sm.calc += #add sm.calc
$execute if score #add sm.calc matches 1.. store result storage secret_milestones:debris_zones p$(id)."$(d)"."$(x),$(y),$(z)" int 1 run scoreboard players get #used sm.calc
scoreboard players operation @s sm.debris += #add sm.calc
$execute store result storage secret_milestones:debris p$(id).valid int 1 run scoreboard players get @s sm.debris
# Para el panel: todo lo minado, y cuánto de eso era colocado
$execute store result score #total sm.calc run data get storage secret_milestones:debris p$(id).mined
scoreboard players operation #total sm.calc += #mined sm.calc
$execute store result storage secret_milestones:debris p$(id).mined int 1 run scoreboard players get #total sm.calc
$execute store result score #total sm.calc run data get storage secret_milestones:debris p$(id).reused
scoreboard players operation #total sm.calc += #mined sm.calc
scoreboard players operation #total sm.calc -= #left sm.calc
$execute store result storage secret_milestones:debris p$(id).reused int 1 run scoreboard players get #total sm.calc
