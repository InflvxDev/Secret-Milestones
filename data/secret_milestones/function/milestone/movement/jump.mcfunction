# Interno: @s saltó en este tick. Le cuenta hasta el cupo de la zona de 16x16x16 donde está parado
# (#jump_cap en load): saltar en el mismo lugar con una macro deja de sumar.
scoreboard players operation #d sm.calc = @s sm.jump
scoreboard players set @s sm.jump 0
execute unless function secret_milestones:milestone/movement/active run return 0
data modify storage secret_milestones:tmp zone set value {}
execute store result storage secret_milestones:tmp zone.id int 1 run scoreboard players get @s sm.id
data modify storage secret_milestones:tmp pos set from entity @s Pos
data modify storage secret_milestones:tmp zone.d set from entity @s Dimension
# 0.0625 = 1/16 (data get redondea hacia abajo, también en negativos)
execute store result storage secret_milestones:tmp zone.x int 1 run data get storage secret_milestones:tmp pos[0] 0.0625
execute store result storage secret_milestones:tmp zone.y int 1 run data get storage secret_milestones:tmp pos[1] 0.0625
execute store result storage secret_milestones:tmp zone.z int 1 run data get storage secret_milestones:tmp pos[2] 0.0625
function secret_milestones:milestone/movement/jump_run with storage secret_milestones:tmp zone
