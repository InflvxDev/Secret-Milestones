# Interno: {id}
$execute store result storage secret_milestones:stone p$(id).valid int 1 run scoreboard players get @s sm.valid
$execute store result score #total sm.calc run data get storage secret_milestones:stone p$(id).placed
scoreboard players operation #total sm.calc += #placed sm.calc
$execute store result storage secret_milestones:stone p$(id).placed int 1 run scoreboard players get #total sm.calc
