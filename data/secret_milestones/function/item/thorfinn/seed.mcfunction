# Interno: @s es la semilla recién caída. Se gasta una para replantar (solo una vez por cultivo).
execute if score #took sm.calc matches 1 run return 0
scoreboard players set #took sm.calc 1
execute store result score #c sm.calc run data get entity @s Item.count
execute if score #c sm.calc matches ..1 run return run kill @s
scoreboard players remove #c sm.calc 1
execute store result entity @s Item.count int 1 run scoreboard players get #c sm.calc
