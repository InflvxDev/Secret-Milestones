# Interno: procesa queue[0] y sigue (recursivo)
function secret_milestones:milestone/stone_1m/refund_one with storage secret_milestones:tmp queue[0]
data remove storage secret_milestones:tmp queue[0]
execute if data storage secret_milestones:tmp queue[0] run function secret_milestones:milestone/stone_1m/refund_loop
