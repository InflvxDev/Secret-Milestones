# Interno: {id, k}. Suma lo que crafteó @s del componente k. Cada uno cuenta hasta 1000.
$execute store result score #o sm.calc run data get storage secret_milestones:redstone p$(id).$(k)
$scoreboard players operation #v sm.calc = @s sm.r.$(k)
$scoreboard players reset @s sm.r.$(k)
execute if score #o sm.calc matches 1000.. run return 0
scoreboard players operation #v sm.calc += #o sm.calc
# Llegó a 1000 de este componente: uno más listo
execute if score #v sm.calc matches 1000.. run scoreboard players add @s sm.red 1
execute if score #v sm.calc matches 1000.. run scoreboard players set #v sm.calc 1000
$execute store result storage secret_milestones:redstone p$(id).$(k) int 1 run scoreboard players get #v sm.calc
$execute store result storage secret_milestones:redstone p$(id).done int 1 run scoreboard players get @s sm.red
