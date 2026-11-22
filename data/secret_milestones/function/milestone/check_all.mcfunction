# Interno: una línea por hito.
# Se usa @e y no @a para saltar a los muertos: cobran al reaparecer.
scoreboard players set #t sm.calc 0
execute as @e[type=minecraft:player,gamemode=!spectator,predicate=secret_milestones:stone_1m] run function secret_milestones:milestone/stone_1m/check
