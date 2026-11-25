# Interno: {k, g}. @s minó una mena de deepslate.
# Con Toque de seda no cuenta: la mena solo se consigue así, y al romperla sin él ya no vuelve.
# Así cada mena natural cuenta una sola vez, la mine como la mine.
$scoreboard players operation #mined sm.calc = @s sm.dp.$(k)
$scoreboard players reset @s sm.dp.$(k)
execute if items entity @s weapon.mainhand *[minecraft:enchantments~[{enchantments:"minecraft:silk_touch"}]] run return 0
data modify storage secret_milestones:tmp deep set value {}
execute store result storage secret_milestones:tmp deep.id int 1 run scoreboard players get @s sm.id
$data modify storage secret_milestones:tmp deep.k set value "$(k)"
$data modify storage secret_milestones:tmp deep.g set value $(g)
function secret_milestones:milestone/deep_mine/add with storage secret_milestones:tmp deep
