# Interno: {k}. @s recibió #hp décimas de vida de daño del tipo k (antes de la armadura).
# Lo llama gen/hurt_<k>, que dispara el advancement hurt_<k> justo al recibir el golpe.
# Solo en survival o aventura y sin AFK (lo mismo que el hito 11).
execute unless function secret_milestones:milestone/movement/active run return 0
data modify storage secret_milestones:tmp zone set value {}
execute store result storage secret_milestones:tmp zone.id int 1 run scoreboard players get @s sm.id
$data modify storage secret_milestones:tmp zone.k set value "$(k)"
data modify storage secret_milestones:tmp pos set from entity @s Pos
data modify storage secret_milestones:tmp zone.d set from entity @s Dimension
# 0.0625 = 1/16 (data get redondea hacia abajo, también en negativos)
execute store result storage secret_milestones:tmp zone.x int 1 run data get storage secret_milestones:tmp pos[0] 0.0625
execute store result storage secret_milestones:tmp zone.y int 1 run data get storage secret_milestones:tmp pos[1] 0.0625
execute store result storage secret_milestones:tmp zone.z int 1 run data get storage secret_milestones:tmp pos[2] 0.0625
function secret_milestones:milestone/hurt/add_run with storage secret_milestones:tmp zone
