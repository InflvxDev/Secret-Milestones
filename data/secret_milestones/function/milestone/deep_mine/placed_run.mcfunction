# Interno: {id, k}
$execute store result score #total sm.calc run data get storage secret_milestones:deep p$(id).placed_$(k)
scoreboard players operation #total sm.calc += #placed sm.calc
$execute store result storage secret_milestones:deep p$(id).placed_$(k) int 1 run scoreboard players get #total sm.calc
