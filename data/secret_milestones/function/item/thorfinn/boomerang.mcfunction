# Interno: @s es el boomerang de #own: la azada acostada, que gira mientras vuela.
# sm.hbs: 1 va hacia la cadena, 2 vuelve al jugador. sm.hage: ticks en el aire.
tag @s add sm.hb
scoreboard players operation @s sm.id = #own sm.calc
scoreboard players set @s sm.hbs 1
scoreboard players set @s sm.hage 0
data merge entity @s {teleport_duration:1,item_display:"fixed",brightness:{sky:15,block:15},item:{id:"minecraft:netherite_hoe",count:1,components:{"minecraft:enchantment_glint_override":true}},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.3f,1.3f,1.3f]}}
