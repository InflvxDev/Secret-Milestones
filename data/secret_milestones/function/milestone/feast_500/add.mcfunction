# Interno: {id, k}. Suma lo que comió @s de la comida k. Cada una cuenta hasta 500.
$execute store result score #o sm.calc run data get storage secret_milestones:feast p$(id).$(k)
$scoreboard players operation #v sm.calc = @s sm.f.$(k)
$scoreboard players reset @s sm.f.$(k)
execute if score #o sm.calc matches 500.. run return 0
scoreboard players operation #v sm.calc += #o sm.calc
# Llegó a 500 de esta comida: una más lista
execute if score #v sm.calc matches 500.. run scoreboard players add @s sm.food 1
execute if score #v sm.calc matches 500.. run scoreboard players set #v sm.calc 500
$execute store result storage secret_milestones:feast p$(id).$(k) int 1 run scoreboard players get #v sm.calc
$execute store result storage secret_milestones:feast p$(id).done int 1 run scoreboard players get @s sm.food
