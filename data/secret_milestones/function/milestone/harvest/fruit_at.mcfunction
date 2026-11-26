# Interno: @s es lo que soltó un fruto, recién caído dentro de su hueco. Lee la posición del bloque.
tag @s add sm.hc
# data get redondea hacia abajo, también en negativos: es el bloque donde estaba
execute store result storage secret_milestones:tmp fr.x int 1 run data get entity @s Pos[0]
execute store result storage secret_milestones:tmp fr.y int 1 run data get entity @s Pos[1]
execute store result storage secret_milestones:tmp fr.z int 1 run data get entity @s Pos[2]
function secret_milestones:milestone/harvest/fruit_check with storage secret_milestones:tmp fr
