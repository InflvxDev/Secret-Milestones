# Interno: {id}
$execute store result score #v sm.calc run data get storage secret_milestones:stone p$(id).valid
$execute store result score #p sm.calc run data get storage secret_milestones:stone p$(id).placed
scoreboard players operation #v sm.calc += #p sm.calc
$execute store result storage secret_milestones:stone p$(id).valid int 1 run scoreboard players get #v sm.calc
