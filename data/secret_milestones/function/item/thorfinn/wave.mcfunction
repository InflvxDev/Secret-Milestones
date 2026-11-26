# Interno: {own}. Una ola de la reacción en cadena: corta lo de la ola actual (sm.hq) y marca los
# cultivos de al lado como la ola siguiente (sm.hn). Si no queda nada, el boomerang vuelve.
$execute as @e[type=minecraft:marker,tag=sm.hq,scores={sm.id=$(own)}] at @s run function secret_milestones:item/thorfinn/visit
$execute as @e[type=minecraft:marker,tag=sm.hn,scores={sm.id=$(own)}] run function secret_milestones:item/thorfinn/promote
# El objetivo pasa a uno de la ola nueva
$execute unless entity @e[type=minecraft:marker,tag=sm.hq,scores={sm.id=$(own)}] run return run scoreboard players set @s sm.hbs 2
$execute as @e[type=minecraft:marker,tag=sm.hq,scores={sm.id=$(own)},sort=random,limit=1] run tp @e[type=minecraft:marker,tag=sm.ht,scores={sm.id=$(own)},limit=1] @s
