# Interno: {u}. Jugador nuevo. El contador de ids va en storage para sobrevivir a una reinstalación.
execute store result score #next sm.calc run data get storage secret_milestones:players next
scoreboard players add #next sm.calc 1
execute store result storage secret_milestones:players next int 1 run scoreboard players get #next sm.calc
$data modify storage secret_milestones:players list append value {u:$(u),n:"?",id:0}
$data modify storage secret_milestones:players list[{u:$(u)}].id set from storage secret_milestones:players next
