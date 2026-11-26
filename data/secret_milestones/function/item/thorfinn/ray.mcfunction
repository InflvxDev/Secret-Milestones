# Interno: avanza de a 0,1 bloques hasta el primer cultivo (6 bloques como mucho), como el del Woodozer.
execute if block ~ ~ ~ #secret_milestones:harvest_click align xyz positioned ~.5 ~.5 ~.5 summon minecraft:marker run return run function secret_milestones:item/thorfinn/origin
scoreboard players add #ray sm.calc 1
execute if score #ray sm.calc matches ..60 if block ~ ~ ~ #secret_milestones:ray_pass positioned ^ ^ ^0.1 run function secret_milestones:item/thorfinn/ray
