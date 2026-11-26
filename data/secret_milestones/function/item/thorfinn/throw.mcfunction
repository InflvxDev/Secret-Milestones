# Interno: {own}. Un boomerang por jugador: hasta que vuelve no se puede lanzar otro.
$execute if entity @e[type=minecraft:item_display,tag=sm.hb,scores={sm.id=$(own)}] run return 0
scoreboard players operation #own sm.calc = @s sm.id
scoreboard players set #ray sm.calc 0
scoreboard players set #hit sm.calc 0
execute at @s anchored eyes positioned ^ ^ ^ run function secret_milestones:item/thorfinn/ray
execute if score #hit sm.calc matches 0 run return 0
# El boomerang sale de la mano
execute at @s anchored eyes positioned ^-0.3 ^-0.3 ^0.6 summon minecraft:item_display run function secret_milestones:item/thorfinn/boomerang
execute at @s run playsound minecraft:item.trident.throw player @a ~ ~ ~ 1 0.8
