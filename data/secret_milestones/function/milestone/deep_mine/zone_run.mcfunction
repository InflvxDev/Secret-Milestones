# Interno: {id, k, g, d, x, y, z}
$execute store result score #used sm.calc run data get storage secret_milestones:deep_zones p$(id).$(k)."$(d)"."$(x),$(y),$(z)"
# Suma lo menor entre lo minado y lo que le queda a la zona
$scoreboard players operation #add sm.calc = #cap_$(k) sm.calc
scoreboard players operation #add sm.calc -= #used sm.calc
execute if score #add sm.calc matches ..-1 run scoreboard players set #add sm.calc 0
scoreboard players operation #add sm.calc < #mined sm.calc
scoreboard players operation #used sm.calc += #add sm.calc
$execute if score #add sm.calc matches 1.. store result storage secret_milestones:deep_zones p$(id).$(k)."$(d)"."$(x),$(y),$(z)" int 1 run scoreboard players get #used sm.calc
# Para el panel: lo que quedó fuera de cupo
$execute store result score #n sm.calc run data get storage secret_milestones:deep p$(id).over_$(k)
scoreboard players operation #n sm.calc += #mined sm.calc
scoreboard players operation #n sm.calc -= #add sm.calc
$execute store result storage secret_milestones:deep p$(id).over_$(k) int 1 run scoreboard players get #n sm.calc
scoreboard players operation #mined sm.calc = #add sm.calc
execute if score #mined sm.calc matches 1.. run function secret_milestones:milestone/deep_mine/add with storage secret_milestones:tmp deep
