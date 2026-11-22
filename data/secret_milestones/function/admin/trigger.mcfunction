# Interno: @s tocó un botón del panel (/trigger sm.admin set <valor>)
#   1 = panel, hito*10 + acción (1 = obtener recompensa, 2 = probar hito completo)
scoreboard players operation #a sm.calc = @s sm.admin
scoreboard players set @s sm.admin 0
# Solo para quien abrió el panel con /function secret_milestones:menu (requiere OP)
execute unless entity @s[tag=sm.admin] run return run scoreboard players reset @s sm.admin
scoreboard players enable @s sm.admin
data remove storage secret_milestones:tmp status
execute unless function secret_milestones:player/space run return run function secret_milestones:admin/full

execute if score #a sm.calc matches 11 run return run function secret_milestones:admin/get_stone_1m
execute if score #a sm.calc matches 12 run return run function secret_milestones:admin/test_stone_1m
function secret_milestones:admin/main
