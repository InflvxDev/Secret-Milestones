# Interno: una línea por hito.
# Se usa @e y no @a para saltar a los muertos: cobran al reaparecer.
scoreboard players set #t sm.calc 0
execute as @a unless score @s sm.named matches 1 run function secret_milestones:player/register
execute as @e[type=minecraft:player,gamemode=!spectator,scores={sm.valid=1000000..}] run function secret_milestones:milestone/stone_1m/check
execute as @e[type=minecraft:player,gamemode=!spectator,scores={sm.bow=1..}] if score @s sm.bow >= #bow_goal sm.calc run function secret_milestones:milestone/bow_all/check
execute as @e[type=minecraft:player,gamemode=!spectator,scores={sm.debris=5904..}] run function secret_milestones:milestone/debris_beacon/check
execute as @e[type=minecraft:player,gamemode=!spectator,scores={sm.fish=500..}] run function secret_milestones:milestone/treasure_500/check
# Hito 6: primero se suma lo crafteado
execute as @a run function secret_milestones:milestone/redstone_1000/tally
execute as @e[type=minecraft:player,gamemode=!spectator,scores={sm.red=1..}] if score @s sm.red >= #red_goal sm.calc run function secret_milestones:milestone/redstone_1000/check
# Hito 5: el Nether no cuenta (sus coordenadas valen x8). En creativo no suma.
execute as @e[type=minecraft:player,gamemode=!spectator,gamemode=!creative] at @s unless dimension minecraft:the_nether run function secret_milestones:milestone/farlands/scan
execute as @e[type=minecraft:player,gamemode=!spectator,scores={sm.far=1..}] if score @s sm.far >= #farlands sm.calc run function secret_milestones:milestone/farlands/check
