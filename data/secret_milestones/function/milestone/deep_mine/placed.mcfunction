# Interno: {k}. @s colocó deepslate o tuff. No resta: solo se anota para el panel.
$scoreboard players operation #placed sm.calc = @s sm.du.$(k)
$scoreboard players reset @s sm.du.$(k)
# Construir en creativo no se anota
execute if entity @s[gamemode=creative] run return 0
data modify storage secret_milestones:tmp place set value {}
execute store result storage secret_milestones:tmp place.id int 1 run scoreboard players get @s sm.id
$data modify storage secret_milestones:tmp place.k set value "$(k)"
function secret_milestones:milestone/deep_mine/placed_run with storage secret_milestones:tmp place
