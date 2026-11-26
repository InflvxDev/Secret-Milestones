# Interno: {own}. El boomerang va hacia la cadena. Cuando llega, corta una ola cada 2 ticks
# y el objetivo avanza a la ola siguiente; así parece que va cortando el campo.
$execute unless entity @e[type=minecraft:marker,tag=sm.ht,scores={sm.id=$(own)}] run return run scoreboard players set @s sm.hbs 2
$execute unless entity @e[type=minecraft:marker,tag=sm.ht,scores={sm.id=$(own)},distance=..1] facing entity @n[type=minecraft:marker,tag=sm.ht,scores={sm.id=$(own)}] feet positioned ^ ^ ^0.8 rotated as @s run return run tp @s ~ ~ ~ ~45 ~
# Llegó: gira en el lugar mientras corta
execute rotated as @s run tp @s ~ ~ ~ ~45 ~
scoreboard players operation #par sm.calc = @s sm.hage
scoreboard players operation #par sm.calc %= #2 sm.calc
$execute if score #par sm.calc matches 0 run function secret_milestones:item/thorfinn/wave {own:$(own)}
