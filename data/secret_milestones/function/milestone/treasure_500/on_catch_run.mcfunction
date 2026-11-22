# Interno: {id}
$execute store result score @s sm.fish run data get storage secret_milestones:fishing p$(id).valid
scoreboard players add @s sm.fish 1
$execute store result storage secret_milestones:fishing p$(id).valid int 1 run scoreboard players get @s sm.fish
