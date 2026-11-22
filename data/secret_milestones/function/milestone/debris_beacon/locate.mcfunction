# Interno: @s es el marker. Deja x, y, z y la zona k en tmp pl.
data modify storage secret_milestones:tmp pos set from entity @s Pos
kill @s
execute store result score #x sm.calc run data get storage secret_milestones:tmp pos[0]
execute store result score #y sm.calc run data get storage secret_milestones:tmp pos[1]
execute store result score #z sm.calc run data get storage secret_milestones:tmp pos[2]
execute store result storage secret_milestones:tmp pl.x int 1 run scoreboard players get #x sm.calc
execute store result storage secret_milestones:tmp pl.y int 1 run scoreboard players get #y sm.calc
execute store result storage secret_milestones:tmp pl.z int 1 run scoreboard players get #z sm.calc
execute store result storage secret_milestones:tmp pl.kx int 1 run scoreboard players operation #x sm.calc /= #16 sm.calc
execute store result storage secret_milestones:tmp pl.ky int 1 run scoreboard players operation #y sm.calc /= #16 sm.calc
execute store result storage secret_milestones:tmp pl.kz int 1 run scoreboard players operation #z sm.calc /= #16 sm.calc
