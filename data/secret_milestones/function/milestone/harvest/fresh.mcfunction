# Interno: @s es un ítem del producto recién caído. Si trae al menos #min, era un cultivo maduro.
# Se marca para no contarlo dos veces.
execute store result score #c sm.calc run data get entity @s Item.count
execute if score #c sm.calc < #min sm.calc run return 0
tag @s add sm.hc
scoreboard players add #n sm.calc 1
