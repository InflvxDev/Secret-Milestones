# Interno: @s usó una caña con zanahoria. Si es la llave, gira el bloque que mira.
scoreboard players reset @s sm.wrench
execute if score @s sm.wcd matches 1.. run return 0
execute unless items entity @s weapon.* minecraft:carrot_on_a_stick[minecraft:custom_data~{secret_milestones:"red_power"}] run return 0
# En aventura no se pueden cambiar bloques
execute unless entity @s[gamemode=!adventure,gamemode=!spectator] run return 0
# Con el clic mantenido se usa cada 4 ticks: así gira de a un paso
scoreboard players set @s sm.wcd 5
scoreboard players set #ray sm.calc 50
execute at @s anchored eyes positioned ^ ^ ^ run function secret_milestones:item/red_power/ray
