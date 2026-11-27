# Interno: lo llama el encantamiento secret_milestones:mace_chaos después de cada golpe pesado con el mazo
# (cayendo 1,5 bloques o más, como el golpe pesado de vanilla), como la víctima (@s). El que pegó es su "attacker".
# Si sale el caos, los mobs cercanos salen volando hacia arriba y hacia afuera desde el golpe.
scoreboard players set #proc sm.calc 0
execute on attacker if entity @s[type=minecraft:player] run function secret_milestones:item/chaos_mace/roll
execute if score #proc sm.calc matches 0 run return 0
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["sm.mimp"]}
execute at @s as @e[type=#secret_milestones:attackers,type=!#secret_milestones:bosses,distance=..5] at @s run function secret_milestones:item/chaos_mace/launch
kill @e[type=minecraft:marker,tag=sm.mimp]
execute at @s run particle minecraft:gust_emitter_small ~ ~0.5 ~ 0 0 0 0 1
execute at @s run particle minecraft:witch ~ ~1 ~ 2 0.5 2 0 60
execute at @s run playsound minecraft:entity.evoker.cast_spell player @a ~ ~ ~ 0.7 1.3
execute at @s run playsound minecraft:entity.wind_charge.wind_burst player @a ~ ~ ~ 1 0.8
