# Interno: lo llama el encantamiento secret_milestones:trident_chaos justo después de empujar a @s.
# Así el empuje se da una sola vez. Mientras tenga el tridente en la mano no recibe daño de caída
# hasta tocar el suelo (sm.tfall, como mucho 5 segundos).
scoreboard players set @s sm.tgo 0
scoreboard players set @s sm.tfall 100
execute at @s run playsound minecraft:item.trident.riptide_3 player @a ~ ~ ~ 1 1
execute at @s run particle minecraft:witch ~ ~1 ~ 0.3 0.5 0.3 0 20
