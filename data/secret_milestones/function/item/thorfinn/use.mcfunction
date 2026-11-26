# Interno: @s mantiene el clic derecho con la Thorfinn Harvest (advancement thorfinn_use, cada tick mientras la usa).
# Lanza el boomerang solo al empezar el clic: busca el cultivo al que apunta y empieza la cadena desde ahí.
advancement revoke @s only secret_milestones:thorfinn_use
execute if score @s sm.huse matches 1.. run return run scoreboard players set @s sm.huse 2
scoreboard players set @s sm.huse 2
execute unless entity @s[gamemode=!spectator,gamemode=!creative] run return 0
execute unless items entity @s weapon.mainhand minecraft:netherite_hoe[minecraft:custom_data~{secret_milestones:"thorfinn_harvest"}] run return 0
data modify storage secret_milestones:tmp th set value {}
execute store result storage secret_milestones:tmp th.own int 1 run scoreboard players get @s sm.id
function secret_milestones:item/thorfinn/throw with storage secret_milestones:tmp th
