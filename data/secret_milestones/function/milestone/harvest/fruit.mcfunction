# Interno: {k, g, s, a}. @s rompió melones o calabazas en este tick.
# Solo cuentan los que crecieron de su tallo: lo que soltó cae dentro del hueco del fruto, y ahí se mira
# que no esté anotado como colocado y que al lado esté su tallo (s crecido, o a todavía mirándolo).
# Así la decoración no cuenta al romperla, y ponerla no resta.
$scoreboard players operation #d sm.calc = @s sm.hv.$(k)
$scoreboard players reset @s sm.hv.$(k)
execute unless function secret_milestones:milestone/movement/active run return 0
scoreboard players set #n sm.calc 0
data modify storage secret_milestones:tmp fr set value {}
data modify storage secret_milestones:tmp fr.d set from entity @s Dimension
$data modify storage secret_milestones:tmp fr.s set value "$(s)"
$data modify storage secret_milestones:tmp fr.a set value "$(a)"
$execute at @s as @e[type=minecraft:item,distance=..8,tag=!sm.hc,nbt={Age:0s}] if items entity @s contents #secret_milestones:harvest_$(k) run function secret_milestones:milestone/harvest/fruit_at
scoreboard players operation #n sm.calc < #d sm.calc
execute if score #n sm.calc matches ..0 run return 0
scoreboard players operation #mined sm.calc = #n sm.calc
data modify storage secret_milestones:tmp hv set value {}
execute store result storage secret_milestones:tmp hv.id int 1 run scoreboard players get @s sm.id
$data modify storage secret_milestones:tmp hv.k set value "$(k)"
$data modify storage secret_milestones:tmp hv.g set value $(g)
function secret_milestones:milestone/harvest/add with storage secret_milestones:tmp hv
