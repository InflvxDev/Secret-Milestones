# Interno: una línea por hito.
# Se usa @e y no @a para saltar a los muertos: cobran al reaparecer.
scoreboard players set #t sm.calc 0
execute as @a unless score @s sm.named matches 1 run function secret_milestones:player/register
execute as @e[type=minecraft:player,gamemode=!spectator,scores={sm.valid=1000000..}] run function secret_milestones:milestone/stone_1m/check
execute as @e[type=minecraft:player,gamemode=!spectator,scores={sm.bow=1..}] if score @s sm.bow >= #bow_goal sm.calc run function secret_milestones:milestone/bow_all/check
