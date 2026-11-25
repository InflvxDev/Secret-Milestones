# Interno: @s taló troncos en este tick. Le cuenta hasta el cupo de la zona donde está parado,
# igual que el stone: poner y romper troncos en el mismo sitio deja de sumar.
scoreboard players operation #mined sm.calc = @s sm.lmined
scoreboard players set @s sm.lmined 0
data modify storage secret_milestones:tmp zone set value {}
execute store result storage secret_milestones:tmp zone.id int 1 run scoreboard players get @s sm.id
data modify storage secret_milestones:tmp pos set from entity @s Pos
data modify storage secret_milestones:tmp zone.d set from entity @s Dimension
# 0.0625 = 1/16 (data get redondea hacia abajo, también en negativos)
execute store result storage secret_milestones:tmp zone.x int 1 run data get storage secret_milestones:tmp pos[0] 0.0625
execute store result storage secret_milestones:tmp zone.y int 1 run data get storage secret_milestones:tmp pos[1] 0.0625
execute store result storage secret_milestones:tmp zone.z int 1 run data get storage secret_milestones:tmp pos[2] 0.0625
function secret_milestones:milestone/log_100k/on_mine_run with storage secret_milestones:tmp zone
# Woodozer: si lo rompió con él en la mano y sin agacharse, tala el resto del árbol
execute if items entity @s weapon.mainhand minecraft:netherite_axe[minecraft:custom_data~{secret_milestones:"woodozer"}] unless predicate secret_milestones:sneaking run function secret_milestones:item/woodozer/fell
scoreboard players set @s sm.lkind 0
