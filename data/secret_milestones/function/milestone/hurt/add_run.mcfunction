# Interno: {id, k, d, x, y, z}. Suma al tipo k hasta el cupo de la zona (#hcap_<k> en load; 0 = sin cupo).
scoreboard players operation #add sm.calc = #hp sm.calc
$execute unless score #hcap_$(k) sm.calc matches 0 run function secret_milestones:milestone/hurt/zone with storage secret_milestones:tmp zone
$scoreboard players operation @s sm.h$(k) += #add sm.calc
$execute store result storage secret_milestones:hurt p$(id).$(k) int 1 run scoreboard players get @s sm.h$(k)
