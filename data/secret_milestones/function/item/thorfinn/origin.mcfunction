# Interno: @s es el primer marker de la cadena, en el cultivo clicado. Junto a él va el objetivo (sm.ht)
# hacia el que vuela el boomerang: se mueve con la cadena.
scoreboard players set #hit sm.calc 1
tag @s add sm.hx
tag @s add sm.hq
scoreboard players operation @s sm.id = #own sm.calc
scoreboard players set @s sm.hg 0
execute summon minecraft:marker run function secret_milestones:item/thorfinn/target
