# Interno: en el hueco del tronco roto. Primero marca todos los troncos conectados del mismo tipo
# (hasta #fell_cap). Solo si alguno toca hojas naturales (o la copa de un hongo del Nether) es un
# árbol y se rompen: así una casa de troncos no se cae entera. Las hojas se caen solas después.
scoreboard players set #fell sm.calc 0
scoreboard players set #leafy sm.calc 0
function secret_milestones:gen/fell_start
execute if score #leafy sm.calc matches 1 as @e[type=minecraft:marker,tag=sm.fell] at @s run setblock ~ ~ ~ minecraft:air destroy
kill @e[type=minecraft:marker,tag=sm.fell]
