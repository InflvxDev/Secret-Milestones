# Interno: @s tocó un botón del panel (/trigger sm.admin set <valor>)
#   1 = lista, 100000+p = página p de la lista
#   hito*10 + acción: 0 = detalle, 1 = obtener recompensa, 2 = probar hito, 3 = progreso
#   (hito = su posición en milestone/registry, desde 1)
scoreboard players operation #a sm.calc = @s sm.admin
scoreboard players set @s sm.admin 0
# Solo para quien abrió el panel con /function secret_milestones:menu (requiere OP)
execute unless entity @s[tag=sm.admin] run return run scoreboard players reset @s sm.admin
# Cada botón renueva los 2 minutos
scoreboard players set @s sm.time 2400
scoreboard players enable @s sm.admin
data remove storage secret_milestones:tmp status

scoreboard players set #p sm.calc 0
execute if score #a sm.calc matches ..9 run return run function secret_milestones:admin/main
execute if score #a sm.calc matches 100000.. run scoreboard players operation #p sm.calc = #a sm.calc
execute if score #a sm.calc matches 100000.. run scoreboard players operation #p sm.calc -= #100000 sm.calc
execute if score #a sm.calc matches 100000.. run return run function secret_milestones:admin/main

scoreboard players operation #act sm.calc = #a sm.calc
scoreboard players operation #act sm.calc %= #10 sm.calc
scoreboard players operation #i sm.calc = #a sm.calc
scoreboard players operation #i sm.calc /= #10 sm.calc
scoreboard players remove #i sm.calc 1
data modify storage secret_milestones:tmp sel set value {}
execute store result storage secret_milestones:tmp sel.i int 1 run scoreboard players get #i sm.calc
function secret_milestones:admin/select with storage secret_milestones:tmp sel
