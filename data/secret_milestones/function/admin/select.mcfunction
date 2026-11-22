# Interno: {i}. Copia el hito elegido a tmp m y hace la acción #act
data remove storage secret_milestones:tmp m
$data modify storage secret_milestones:tmp m set from storage secret_milestones:db milestones[$(i)]
execute unless data storage secret_milestones:tmp m run return run function secret_milestones:admin/main

execute if score #act sm.calc matches 3 run return run function secret_milestones:admin/progress
execute unless score #act sm.calc matches 1..2 run return run function secret_milestones:admin/detail
# De aquí en adelante todo entrega un ítem
execute unless function secret_milestones:player/space run return run function secret_milestones:admin/full
execute if score #act sm.calc matches 1 run return run function secret_milestones:admin/get with storage secret_milestones:tmp m
function secret_milestones:admin/test with storage secret_milestones:tmp m
