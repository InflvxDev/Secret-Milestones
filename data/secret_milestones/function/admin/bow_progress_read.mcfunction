# Interno: {id}. c = tipos de mob que lleva
$execute store result score #c sm.calc run data get storage secret_milestones:bow p$(id)
execute store result storage secret_milestones:tmp row.c int 1 run scoreboard players get #c sm.calc
