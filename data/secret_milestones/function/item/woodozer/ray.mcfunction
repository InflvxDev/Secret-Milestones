# Interno: avanza de a 0,1 bloques hasta el primer tronco (5 bloques como mucho).
# Se corta en cualquier bloque que tape la mira (hojas, lianas...): ese es el que rompería.
execute if block ~ ~ ~ #minecraft:logs align xyz positioned ~.5 ~.5 ~.5 summon minecraft:marker run return run function secret_milestones:item/woodozer/mark
scoreboard players add #ray sm.calc 1
execute if score #ray sm.calc matches ..50 if block ~ ~ ~ #secret_milestones:ray_pass positioned ^ ^ ^0.1 run function secret_milestones:item/woodozer/ray
