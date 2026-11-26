# Interno: {id, k, d, x, y, z}. Deja en #add lo menor entre el daño y lo que le queda a la zona.
# Una granja de mobs fija, o quedarse en lava curándose, deja de sumar.
$execute store result score #used sm.calc run data get storage secret_milestones:hurt_zones p$(id).$(k)."$(d)"."$(x),$(y),$(z)"
$scoreboard players operation #add sm.calc = #hcap_$(k) sm.calc
scoreboard players operation #add sm.calc -= #used sm.calc
execute if score #add sm.calc matches ..-1 run scoreboard players set #add sm.calc 0
scoreboard players operation #add sm.calc < #hp sm.calc
scoreboard players operation #used sm.calc += #add sm.calc
$execute if score #add sm.calc matches 1.. store result storage secret_milestones:hurt_zones p$(id).$(k)."$(d)"."$(x),$(y),$(z)" int 1 run scoreboard players get #used sm.calc
# Para el panel: lo que quedó fuera de cupo (de todos los tipos juntos)
scoreboard players operation #d sm.calc = #hp sm.calc
scoreboard players operation #d sm.calc -= #add sm.calc
execute if score #d sm.calc matches ..0 run return 0
$execute store result score #n sm.calc run data get storage secret_milestones:hurt p$(id).o
scoreboard players operation #n sm.calc += #d sm.calc
$execute store result storage secret_milestones:hurt p$(id).o int 1 run scoreboard players get #n sm.calc
