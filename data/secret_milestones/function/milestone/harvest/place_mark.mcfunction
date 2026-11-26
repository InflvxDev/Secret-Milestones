# Interno: @s es un marker en la esquina del fruto colocado: solo sirve para leer las coordenadas.
execute store result storage secret_milestones:tmp fr.x int 1 run data get entity @s Pos[0]
execute store result storage secret_milestones:tmp fr.y int 1 run data get entity @s Pos[1]
execute store result storage secret_milestones:tmp fr.z int 1 run data get entity @s Pos[2]
kill @s
function secret_milestones:milestone/harvest/place_run with storage secret_milestones:tmp fr
