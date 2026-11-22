# Interno: {id}. Para el panel: cuánto colocó.
$execute store result score #n sm.calc run data get storage secret_milestones:debris p$(id).placed
scoreboard players add #n sm.calc 1
$execute store result storage secret_milestones:debris p$(id).placed int 1 run scoreboard players get #n sm.calc
