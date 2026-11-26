# Interno: {k, p, min, g}. @s rompió el cultivo k en este tick. Solo cuenta lo que estaba maduro:
# se mira lo que soltó (el producto p, recién caído, con al menos min). Así romper verde no suma.
$scoreboard players operation #d sm.calc = @s sm.hv.$(k)
$scoreboard players reset @s sm.hv.$(k)
execute unless function secret_milestones:milestone/movement/active run return 0
scoreboard players set #n sm.calc 0
$scoreboard players set #min sm.calc $(min)
$execute at @s as @e[type=minecraft:item,distance=..8,tag=!sm.hc,nbt={Age:0s}] if items entity @s contents $(p) run function secret_milestones:milestone/harvest/fresh
# No más de lo que rompió (por si otro cosechó al lado en el mismo tick)
scoreboard players operation #n sm.calc < #d sm.calc
execute if score #n sm.calc matches ..0 run return 0
scoreboard players operation #mined sm.calc = #n sm.calc
data modify storage secret_milestones:tmp hv set value {}
execute store result storage secret_milestones:tmp hv.id int 1 run scoreboard players get @s sm.id
$data modify storage secret_milestones:tmp hv.k set value "$(k)"
$data modify storage secret_milestones:tmp hv.g set value $(g)
function secret_milestones:milestone/harvest/add with storage secret_milestones:tmp hv
