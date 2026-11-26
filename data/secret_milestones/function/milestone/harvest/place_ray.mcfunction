# Interno: avanza de a 0,1 bloques hasta el primer melón o calabaza (6 bloques como mucho)
execute if block ~ ~ ~ #secret_milestones:harvest_fruit align xyz summon minecraft:marker run return run function secret_milestones:milestone/harvest/place_mark
scoreboard players add #ray sm.calc 1
execute if score #ray sm.calc matches ..60 if block ~ ~ ~ #secret_milestones:ray_pass positioned ^ ^ ^0.1 run function secret_milestones:milestone/harvest/place_ray
