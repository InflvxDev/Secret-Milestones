# Interno: {num, p}. El hito -> tmp lm y su parte p -> tmp lp (solo si la estadística está activa)
data remove storage secret_milestones:tmp lm
data remove storage secret_milestones:tmp lp
$data modify storage secret_milestones:tmp lm set from storage secret_milestones:db stats[{num:$(num)}]
execute unless data storage secret_milestones:tmp lm run return fail
function secret_milestones:link/find_on with storage secret_milestones:tmp lm
$execute if data storage secret_milestones:tmp lm run data modify storage secret_milestones:tmp lp set from storage secret_milestones:tmp lm.parts[$(p)]
