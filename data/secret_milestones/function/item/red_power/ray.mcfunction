# Interno: avanza de a 0,1 bloques (hasta 5) hasta el primer bloque que no es aire
execute unless block ~ ~ ~ #minecraft:air align xyz positioned ~0.5 ~0.5 ~0.5 run return run function secret_milestones:gen/red_rotate
scoreboard players remove #ray sm.calc 1
execute if score #ray sm.calc matches 1.. positioned ^ ^ ^0.1 run function secret_milestones:item/red_power/ray
