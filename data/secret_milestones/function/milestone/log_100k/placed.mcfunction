# Interno: {k}. @s colocó troncos de tipo k. No resta: solo se anota para el panel.
$scoreboard players operation #placed sm.calc = @s sm.lp.$(k)
$scoreboard players reset @s sm.lp.$(k)
# Construir en creativo no se anota
execute if entity @s[gamemode=creative] run return 0
data modify storage secret_milestones:tmp place set value {}
execute store result storage secret_milestones:tmp place.id int 1 run scoreboard players get @s sm.id
function secret_milestones:milestone/log_100k/placed_run with storage secret_milestones:tmp place
