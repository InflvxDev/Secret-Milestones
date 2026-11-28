# Interno: lq[0] y sigue (recursivo)
data modify storage secret_milestones:tmp lr set from storage secret_milestones:tmp lq[0]
function secret_milestones:link/values_one
data remove storage secret_milestones:tmp lq[0]
execute if data storage secret_milestones:tmp lq[0] run function secret_milestones:link/values_loop
