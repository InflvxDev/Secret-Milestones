# Interno: {id, d, x, y, z}
$execute store result score #used sm.calc run data get storage secret_milestones:log_zones p$(id)."$(d)"."$(x),$(y),$(z)"
# Suma lo menor entre lo talado y lo que le queda a la zona
scoreboard players operation #add sm.calc = #log_cap sm.calc
scoreboard players operation #add sm.calc -= #used sm.calc
execute if score #add sm.calc matches ..-1 run scoreboard players set #add sm.calc 0
scoreboard players operation #add sm.calc < #mined sm.calc
scoreboard players operation #used sm.calc += #add sm.calc
$execute if score #add sm.calc matches 1.. store result storage secret_milestones:log_zones p$(id)."$(d)"."$(x),$(y),$(z)" int 1 run scoreboard players get #used sm.calc
scoreboard players operation @s sm.log += #add sm.calc
$execute store result storage secret_milestones:logs p$(id).valid int 1 run scoreboard players get @s sm.log
# Para el panel: todo lo talado
$execute store result score #total sm.calc run data get storage secret_milestones:logs p$(id).mined
scoreboard players operation #total sm.calc += #mined sm.calc
$execute store result storage secret_milestones:logs p$(id).mined int 1 run scoreboard players get #total sm.calc
