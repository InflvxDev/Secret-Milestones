# Interno: {id, k, g}. Suma #mined (puede ser negativo: frutos colocados) al cultivo k de @s.
# Cada cultivo cuenta hasta su meta g; una vez alcanzada ya no baja.
$execute store result score #o sm.calc run data get storage secret_milestones:harvest p$(id).$(k)
$execute if score #o sm.calc matches $(g).. run return 0
scoreboard players operation #o sm.calc += #mined sm.calc
# Llegó a la meta de este cultivo: uno más listo
$execute if score #o sm.calc matches $(g).. run scoreboard players add @s sm.harv 1
$execute if score #o sm.calc matches $(g).. run scoreboard players set #o sm.calc $(g)
$execute store result storage secret_milestones:harvest p$(id).$(k) int 1 run scoreboard players get #o sm.calc
$execute store result storage secret_milestones:harvest p$(id).done int 1 run scoreboard players get @s sm.harv
