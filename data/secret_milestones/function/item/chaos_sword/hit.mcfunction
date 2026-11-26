# Interno: lo llama el encantamiento secret_milestones:chaos justo después de cada golpe con la espada,
# como la víctima (@s). El que pegó es su "attacker". Si sale el caos, @s recibe un efecto al azar.
scoreboard players set #proc sm.calc 0
execute on attacker if entity @s[type=minecraft:player] run function secret_milestones:item/chaos_sword/roll
execute if score #proc sm.calc matches 0 run return 0
execute if score #proc sm.calc matches 1 run effect give @s minecraft:wither 4 0
execute if score #proc sm.calc matches 2 run effect give @s minecraft:nausea 6 0
execute if score #proc sm.calc matches 3 run effect give @s minecraft:blindness 3 0
execute if score #proc sm.calc matches 4 run effect give @s minecraft:slowness 4 1
execute if score #proc sm.calc matches 5 run effect give @s minecraft:weakness 5 0
execute at @s run particle minecraft:witch ~ ~1 ~ 0.3 0.5 0.3 0 20
execute at @s run playsound minecraft:entity.evoker.cast_spell player @a ~ ~ ~ 0.7 1.3
