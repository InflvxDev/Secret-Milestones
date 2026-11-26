# Interno: @s acaba de recibir daño (advancement aegis_hit). Con la Aegis Heart puesta y sin espera,
# Absorción II por 10 s (rellena los 4 corazones extra). Espera: #aegis_cd en load, en ticks.
advancement revoke @s only secret_milestones:aegis_hit
execute if score @s sm.acd matches 1.. run return 0
execute unless items entity @s armor.chest minecraft:netherite_chestplate[minecraft:custom_data~{secret_milestones:"aegis_heart"}] run return 0
effect give @s minecraft:absorption 10 1
scoreboard players operation @s sm.acd = #aegis_cd sm.calc
execute at @s run playsound minecraft:item.armor.equip_netherite player @a ~ ~ ~ 0.8 0.7
