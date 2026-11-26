# Interno: recompensa del advancement fruit_place. @s colocó un melón o una calabaza (decoración).
# Se anota su posición exacta, para todo el server: al romperlo no cuenta para nadie, y no resta nada.
# El bloque colocado es el primero que tiene delante en la mira.
advancement revoke @s only secret_milestones:fruit_place
data modify storage secret_milestones:tmp fr set value {}
data modify storage secret_milestones:tmp fr.d set from entity @s Dimension
scoreboard players set #ray sm.calc 0
execute at @s anchored eyes positioned ^ ^ ^ run function secret_milestones:milestone/harvest/place_ray
