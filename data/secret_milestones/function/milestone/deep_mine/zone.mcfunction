# Interno: {k, g}. @s minó deepslate o tuff: se pueden poner y romper, así que le cuenta
# hasta el cupo de la zona donde está parado (#cap_<k> en load), como el stone.
$scoreboard players operation #mined sm.calc = @s sm.dp.$(k)
$scoreboard players reset @s sm.dp.$(k)
data modify storage secret_milestones:tmp deep set value {}
execute store result storage secret_milestones:tmp deep.id int 1 run scoreboard players get @s sm.id
$data modify storage secret_milestones:tmp deep.k set value "$(k)"
$data modify storage secret_milestones:tmp deep.g set value $(g)
data modify storage secret_milestones:tmp pos set from entity @s Pos
data modify storage secret_milestones:tmp deep.d set from entity @s Dimension
# 0.0625 = 1/16 (data get redondea hacia abajo, también en negativos)
execute store result storage secret_milestones:tmp deep.x int 1 run data get storage secret_milestones:tmp pos[0] 0.0625
execute store result storage secret_milestones:tmp deep.y int 1 run data get storage secret_milestones:tmp pos[1] 0.0625
execute store result storage secret_milestones:tmp deep.z int 1 run data get storage secret_milestones:tmp pos[2] 0.0625
function secret_milestones:milestone/deep_mine/zone_run with storage secret_milestones:tmp deep
