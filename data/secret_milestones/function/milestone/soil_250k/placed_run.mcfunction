# Interno: {id}
$execute store result score #total sm.calc run data get storage secret_milestones:soils p$(id).placed
scoreboard players operation #total sm.calc += #placed sm.calc
$execute store result storage secret_milestones:soils p$(id).placed int 1 run scoreboard players get #total sm.calc
