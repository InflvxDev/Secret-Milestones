# Interno: la bendición del banquete. Un efecto al azar por 1 minuto, un nivel o más por encima de vanilla
# (pociones, faros y manzanas), pero sin llegar a lo que perjudica: nada de Velocidad tan alta que no se
# controla, Salto tan alto que mata al caer, ni Resistencia V (inmortal).
#   1 Fuerza V          (poción: II)       5 Regeneración III     (poción: II)
#   2 Velocidad III     (poción: II)       6 Salto III            (poción: II; reduce también la caída)
#   3 Prisa III         (faro: II)         7 Absorción V          (manzana encantada: IV)
#   4 Resistencia III   (faro y tortuga: I-II)  8 Vida extra III  (+6 corazones; al terminar se van sin daño)
execute store result score #b sm.calc run random value 1..8
execute if score #b sm.calc matches 1 run effect give @s minecraft:strength 60 4
execute if score #b sm.calc matches 2 run effect give @s minecraft:speed 60 2
execute if score #b sm.calc matches 3 run effect give @s minecraft:haste 60 2
execute if score #b sm.calc matches 4 run effect give @s minecraft:resistance 60 2
execute if score #b sm.calc matches 5 run effect give @s minecraft:regeneration 60 2
execute if score #b sm.calc matches 6 run effect give @s minecraft:jump_boost 60 2
execute if score #b sm.calc matches 7 run effect give @s minecraft:absorption 60 4
execute if score #b sm.calc matches 8 run effect give @s minecraft:health_boost 60 2
execute if score #b sm.calc matches 1 run data modify storage secret_milestones:tmp feast.e set value "Fuerza V"
execute if score #b sm.calc matches 2 run data modify storage secret_milestones:tmp feast.e set value "Velocidad III"
execute if score #b sm.calc matches 3 run data modify storage secret_milestones:tmp feast.e set value "Prisa III"
execute if score #b sm.calc matches 4 run data modify storage secret_milestones:tmp feast.e set value "Resistencia III"
execute if score #b sm.calc matches 5 run data modify storage secret_milestones:tmp feast.e set value "Regeneración III"
execute if score #b sm.calc matches 6 run data modify storage secret_milestones:tmp feast.e set value "Salto III"
execute if score #b sm.calc matches 7 run data modify storage secret_milestones:tmp feast.e set value "Absorción V"
execute if score #b sm.calc matches 8 run data modify storage secret_milestones:tmp feast.e set value "Vida extra III"
title @s actionbar [{text:"¡El banquete te bendice! ",color:"#FFA94D",bold:true},{storage:"secret_milestones:tmp",nbt:"feast.e",color:"yellow"},{text:" por 1 minuto",color:"gray"}]
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 0.8 1.4
execute at @s run particle minecraft:happy_villager ~ ~1 ~ 0.4 0.6 0.4 0 25 normal @a
data remove storage secret_milestones:tmp feast
