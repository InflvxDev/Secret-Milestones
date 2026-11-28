# Interno: lq[0] y sigue (recursivo)
data modify storage secret_milestones:tmp la set value {}
data modify storage secret_milestones:tmp la.id set from storage secret_milestones:tmp lq[0].id
data modify storage secret_milestones:tmp la.u set from storage secret_milestones:tmp lu.u
function secret_milestones:link/export_one with storage secret_milestones:tmp la
data remove storage secret_milestones:tmp lq[0]
execute if data storage secret_milestones:tmp lq[0] run function secret_milestones:link/export_loop
