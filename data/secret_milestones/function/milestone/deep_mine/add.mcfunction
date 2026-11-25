# Interno: {id, k, g}. Suma #mined al bloque k de @s. Cada bloque cuenta hasta su meta g.
$execute store result score #o sm.calc run data get storage secret_milestones:deep p$(id).$(k)
$execute if score #o sm.calc matches $(g).. run return 0
scoreboard players operation #o sm.calc += #mined sm.calc
# Llegó a la meta de este bloque: uno más listo
$execute if score #o sm.calc matches $(g).. run scoreboard players add @s sm.deep 1
$execute if score #o sm.calc matches $(g).. run scoreboard players set #o sm.calc $(g)
$execute store result storage secret_milestones:deep p$(id).$(k) int 1 run scoreboard players get #o sm.calc
$execute store result storage secret_milestones:deep p$(id).done int 1 run scoreboard players get @s sm.deep
